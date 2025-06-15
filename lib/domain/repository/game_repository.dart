

import 'package:flutter_project_starter/data/network/data_state.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';

abstract class GameRepository {
  /// Remote
  Future<DataState<List<GameModel>>> getGames({required int page,required String search});

  Future<DataState<GameModel>> getGameDetail({required int id});

  /// Local
  Future<List<GameModel>> getFavoritedGames();
  Future<void> addFavoriteGame({required GameModel game});
  Future<void> removeFavoriteGame({required int id});
  Future<bool> isGameFavorited({required int id});


}