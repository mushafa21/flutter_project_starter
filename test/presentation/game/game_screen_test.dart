import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_starter/data/network/data_state.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/domain/repository/game_repository.dart';
import 'package:flutter_project_starter/presentation/views/game/cubit/game_cubit.dart';
import 'package:flutter_project_starter/presentation/views/game/game_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([GameRepository])
import 'game_screen_test.mocks.dart';

void main() {
  late GameCubit gameCubit;
  late MockGameRepository mockGameRepository;

  final List<GameModel> testGameModels = [
    GameModel(id: 1, name: 'The Witcher 3', added: 1, backgroundImage: '', metacritic: 90, playtime: 10, rating: 4.5, ratingsCount: 100, ratingTop: 5, released: '', reviewsCount: 50, reviewsTextCount: 10, suggestionsCount: 5, updated: ''),
    GameModel(id: 2, name: 'Red Dead Redemption 2', added: 1, backgroundImage: '', metacritic: 85, playtime: 20, rating: 4.2, ratingsCount: 200, ratingTop: 5, released: '', reviewsCount: 70, reviewsTextCount: 20, suggestionsCount: 15, updated: ''),
  ];

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

  Widget makeTestableWidget(Widget body) {
    return BlocProvider<GameCubit>.value(
      value: gameCubit,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  group('GameScreen with Mockito', () {
    testWidgets('renders CircularProgressIndicator then ListView when getGameList is successful', (WidgetTester tester) async {
      when(mockGameRepository.getGames(page: 1,search: ""))
          .thenAnswer((_) async => DataStateSuccess(testGameModels));
      await tester.pumpWidget(makeTestableWidget(GameScreen()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.text('The Witcher 3'), findsOneWidget);
    });

    testWidgets('renders CircularProgressIndicator then error message when getGameList fails', (WidgetTester tester) async {
      when(mockGameRepository.getGames(page: 1, search: ''))
          .thenAnswer((_) async => DataStateError(testDioException));
      await tester.pumpWidget(makeTestableWidget(GameScreen()));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.text(testDioException.message!), findsOneWidget);
    });
  });
}
