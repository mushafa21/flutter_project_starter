import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_starter/app/service_locator.dart';
import 'package:flutter_project_starter/presentation/resources/routes.dart';
import 'package:flutter_project_starter/presentation/resources/values/theme.dart';
import 'package:flutter_project_starter/presentation/views/game/cubit/game_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setUpServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context) => serviceLocator.get<GameCubit>())
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
      ),
    );
  }
}

