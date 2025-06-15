import 'package:flutter_project_starter/data/data_source/remote_data_source.dart';
import 'package:flutter_project_starter/data/dtos/game_dto.dart';
import 'package:flutter_project_starter/data/dtos/responses/game_list_response.dart';
import 'package:flutter_project_starter/data/entities/game_entity.dart';
import 'package:flutter_project_starter/data/network/api_client.dart';
import 'package:flutter_project_starter/data/network/data_state.dart';
import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:flutter_project_starter/domain/repository/game_repository.dart';
import '../../../data/data_source/local_data_source.dart';
import '../base/base_repository.dart';

class GameRepositoryImplementation extends BaseRepository implements GameRepository{
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  GameRepositoryImplementation(this._remoteDataSource, this._localDataSource);

  @override
  Future<DataState<List<GameModel>>> getGames({required int page,required String search}) async {
    DataState<GameListResponse> dataState = await getStateOf<GameListResponse>(request: (){
      return _remoteDataSource.getGames(page: page,search: search);
    });

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data?.results?.map((gameDto)=> gameDto.toModel()).toList() ?? []);
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  @override
  Future<DataState<GameModel>> getGameDetail({required int id}) async {
    DataState<GameDTO> dataState = await getStateOf<GameDTO>(request: (){
      return _remoteDataSource.getGameDetail(id: id);
    });

    if (dataState is DataStateSuccess) {
      return DataStateSuccess(dataState.data!.toModel());
    } else {
      return DataStateError(dataState.exception!);
    }
  }

  @override
  Future<void> addFavoriteGame({required GameModel game}) async{
    final gameEntity = GameEntity(id: game.id, name: game.name, backgroundImage: game.backgroundImage);
    await _localDataSource.addFavorite(gameEntity);
  }

  @override
  Future<List<GameModel>> getFavoritedGames() async {
    final favoritedGames = await _localDataSource.getFavoritedGames();
    return favoritedGames.map((entity)=> entity.toModel()).toList();
  }

  @override
  Future<void> removeFavoriteGame({required int id}) async{
    await _localDataSource.removeFavorite(id);
  }

  @override
  Future<bool> isGameFavorited({required int id}) async {
   return await _localDataSource.isFavorited(id);

  }




}