import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_starter/data/network/data_state.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/domain/repository/game_repository.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final GameRepository _gameRepository;
  int _currentPage = 1;
  bool _endPage = false;
  String _search = "";
  List<GameModel> _gameList = [];
  GameCubit(this._gameRepository) : super(GameStateInitial());



  getGameList({String? search}) async {
    _endPage = false;
    _currentPage = 1;
    if(search != null) {
      _search = search;
    }
    emit(GameStateListLoading());
    final dataState = await _gameRepository.getGames(page: _currentPage,search: _search);

    if (dataState is DataStateSuccess && dataState.data!.isNotEmpty) {
      _gameList = dataState.data!;
      emit(GameStateListData(gameList: _gameList));
    } else if (dataState is DataStateError) {
      // Emit a failure state with the error message
      emit(GameStateListError(message:  dataState.exception!.message ?? "An unknown error occurred"));
    } else {
      // Handle the case where data is empty, could be a separate state if needed
      emit(GameStateListError(message: "No games found."));
    }
  }

  getGameListNextPage() async {
    if(!_endPage){
      emit(GameStateListNextLoading());
      final dataState = await _gameRepository.getGames(page: _currentPage + 1,search: _search);
      if (dataState is DataStateSuccess) {
        final List<GameModel> newGameList = dataState.data ?? [];
        if(newGameList.isEmpty){
          _endPage = true;
        } else{
          _currentPage++;
        }
        _gameList.addAll(newGameList);
        emit(GameStateListData(gameList: _gameList));
      } else if (dataState is DataStateError) {
        emit(GameStateListError(message:  dataState.exception!.message ?? "An unknown error occurred"));
      }
    }

  }


  void getFavoritedGames() async {
    emit(GameStateFavoritedLoading());
    try {
      final games = await _gameRepository.getFavoritedGames();
      if (games.isEmpty) {
        emit(GameStateFavoritedError(message: 'Favorited Game is Empty'));
      } else {
        emit(GameStateFavoritedData(gameList:  games));
      }
    } catch (e) {
      emit(GameStateFavoritedError(message: 'Failed to load favorite games: ${e.toString()}'));
    }
  }

  /// Adds a game to the favorites and then reloads the list.
  void addFavorite(GameModel game) async {
    try {
      await _gameRepository.addFavoriteGame(game: game);
      getFavoritedGames();
    } catch (e) {
      debugPrint('Failed to add favorite: ${e.toString()}');
    }
  }

  /// Removes a game from the favorites and then reloads the list.
  void removeFavorite(int gameId) async {
    try {
      await _gameRepository.removeFavoriteGame(id: gameId);
      getFavoritedGames();
    } catch (e) {
      debugPrint('Failed to remove favorite: ${e.toString()}');
    }
  }


  void checkIfFavorited(int gameId) async {
    try {
      final isFavorited = await _gameRepository.isGameFavorited(id: gameId);
      emit(GameStateFavoritedStatus(isFavorited: isFavorited));
    } catch (e) {
      emit(GameStateFavoritedStatus(isFavorited: false));
    }
  }


}
