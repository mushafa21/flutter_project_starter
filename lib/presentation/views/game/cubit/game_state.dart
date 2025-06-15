part of 'game_cubit.dart';

@immutable
class GameState {}

final class GameStateInitial extends GameState {}

/// List State
final class GameStateListData extends GameState {
  final List<GameModel> gameList;
  GameStateListData({required this.gameList});
}

final class GameStateListLoading extends GameState {}

final class GameStateListNextLoading extends GameState {}

final class GameStateListError extends GameState {
  final String message;
  GameStateListError({required this.message});
}

/// Favorited State
final class GameStateFavoritedData extends GameState {
  final List<GameModel> gameList;
  GameStateFavoritedData({required this.gameList});
}

final class GameStateFavoritedLoading extends GameState {}

final class GameStateFavoritedStatus extends GameState {
  final bool isFavorited;
  GameStateFavoritedStatus({required this.isFavorited});
}

final class GameStateFavoritedError extends GameState {
  final String message;
  GameStateFavoritedError({required this.message});
}


