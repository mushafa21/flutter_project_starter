



import '../database/database_helper.dart';
import '../entities/game_entity.dart';

abstract class LocalDataSource {
  Future<void> addFavorite(GameEntity game);
  Future<void> removeFavorite(int id);
  Future<List<GameEntity>> getFavoritedGames();
  Future<bool> isFavorited(int id);
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper _databaseHelper;
  LocalDataSourceImpl(this._databaseHelper);

  @override
  Future<void> addFavorite(GameEntity game) async{
   await _databaseHelper.insertGame(game);
  }

  @override
  Future<List<GameEntity>> getFavoritedGames() async{
    return await _databaseHelper.getGames();
  }


  @override
  Future<void> removeFavorite(int id) async{
    await _databaseHelper.deleteGame(id);
  }

  @override
  Future<bool> isFavorited(int id) async {
    final gameEntity = await _databaseHelper.getGameById(id);
    return gameEntity != null;
  }


}