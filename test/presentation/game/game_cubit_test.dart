// The file path for this test would typically be: test/presentation/game/game_cubit_test.dart

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project_starter/data/network/data_state.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/domain/repository/game_repository.dart';
import 'package:flutter_project_starter/presentation/views/game/cubit/game_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks([GameRepository])
import 'game_cubit_test.mocks.dart';

void main() {
  late MockGameRepository mockGameRepository;
  late GameCubit gameCubit;

  // dummy list
  final List<GameModel> testGameModels = [
    GameModel(id: 1, name: 'Game 1', added: 1, backgroundImage: '', metacritic: 90, playtime: 10, rating: 4.5, ratingsCount: 100, ratingTop: 5, released: '', reviewsCount: 50, reviewsTextCount: 10, suggestionsCount: 5, updated: ''),
    GameModel(id: 2, name: 'Game 2', added: 1, backgroundImage: '', metacritic: 85, playtime: 20, rating: 4.2, ratingsCount: 200, ratingTop: 5, released: '', reviewsCount: 70, reviewsTextCount: 20, suggestionsCount: 15, updated: ''),
  ];

  // DioException for testing error states.
  final testDioException = DioException(
    requestOptions: RequestOptions(path: ''),
    message: 'Something went wrong',
  );


  setUp(() {
    mockGameRepository = MockGameRepository();
    gameCubit = GameCubit(mockGameRepository);
  });


  tearDown(() {
    gameCubit.close();
  });

  // A test to ensure the initial state of the cubit is correct.
  test('initial state of GameCubit is GameStateInitial', () {
    expect(gameCubit.state, isA<GameStateInitial>());
  });


  group('getGameList', () {
    // What happens when the repository returns data successfully.
    blocTest<GameCubit, GameState>(
      'emits [GameStateListLoading, GameStateListData] when getGames is successful.',
      build: () {
        when(mockGameRepository.getGames(page: 1, search: ''))
            .thenAnswer((_) async => DataStateSuccess(testGameModels));
        return gameCubit;
      },
      act: (cubit) => cubit.getGameList(),
      expect: () => [
        isA<GameStateListLoading>(),
        isA<GameStateListData>(),
      ],
      verify: (_) {
        verify(mockGameRepository.getGames(page: 1,search: "")).called(1);
      },
    );

    // Test what happens when the repository returns an error.
    blocTest<GameCubit, GameState>(
      'emits [GameStateListLoading, GameStateListError] when getGames fails.',
      build: () {
        when(mockGameRepository.getGames(page: 1,search: ""))
            .thenAnswer((_) async => DataStateError(testDioException));
        return gameCubit;
      },
      act: (cubit) => cubit.getGameList(),
      expect: () => [
        isA<GameStateListLoading>(),
        isA<GameStateListError>(),
      ],
    );
  });
}

