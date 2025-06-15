import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project_starter/app/env/env.dart';
import 'package:flutter_project_starter/app/user_preference.dart';
import 'package:flutter_project_starter/data/data_source/local_data_source.dart';
import 'package:flutter_project_starter/data/data_source/remote_data_source.dart';
import 'package:flutter_project_starter/data/network/api_client.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/database/database_helper.dart';
import '../domain/repository/game_repository.dart';
import '../domain/repository/implementation/game_repository_implementation.dart';
import '../presentation/views/game/cubit/game_cubit.dart';
import 'constant.dart';

/// Global [GetIt.instance].
final GetIt serviceLocator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpServiceLocator() async {

  // --- Shared Preferences ---
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<UserPreference>(UserPreference(prefs));


  // --- Networking ---
  serviceLocator.registerFactory<Dio>(() {
    final dio = Dio();
    dio.interceptors.add(AwesomeDioInterceptor());
    dio.options = BaseOptions(
        connectTimeout: const Duration(seconds: timeOutDuration),
        receiveTimeout: const Duration(seconds: timeOutDuration),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        queryParameters: {
          'key' : Env.apiKey
        }
    );

    return dio;
  });

  serviceLocator.registerFactory<ApiClient>(
        () => ApiClient(
      serviceLocator.get<Dio>(),
      baseUrl: baseApi,
    ),
  );

  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper());



  serviceLocator.registerFactory<RemoteDataSource>(
        () => RemoteDataSourceImplementation(serviceLocator.get<ApiClient>())
  );

  serviceLocator.registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(serviceLocator<DatabaseHelper>()),
  );

  serviceLocator.registerLazySingleton<GameRepository>(
        () => GameRepositoryImplementation(
      serviceLocator.get<RemoteDataSource>(),serviceLocator.get<LocalDataSource>()
    ),
  );


  // --- Cubit ---
  serviceLocator.registerFactory<GameCubit>(
        () => GameCubit(
      serviceLocator.get<GameRepository>(),
    ),
  );



}