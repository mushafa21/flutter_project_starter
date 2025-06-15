import 'package:flutter/material.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/presentation/views/game/favorited_game_screen.dart';
import 'package:flutter_project_starter/presentation/views/game/game_detail_screen.dart';
import 'package:flutter_project_starter/presentation/views/home/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../views/game/game_screen.dart';

final rootPath = "/";
final gameListPath = "/games";
final favoritedGamePath = '/favorited-games';
final gameDetailPath = "/game-detail";

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// GoRouter configuration
final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: gameListPath,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: gameListPath,
              builder: (context, state) => const GameScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: favoritedGamePath,
              builder: (context, state) =>  const FavoritedGameScreen(),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: gameDetailPath,
      builder: (context, state) {
        final gameModel = state.extra as GameModel;
        return GameDetailScreen(gameModel: gameModel);
      },
    ),
  ],
);