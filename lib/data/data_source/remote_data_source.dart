import 'package:flutter_project_starter/data/dtos/game_dto.dart';
import 'package:flutter_project_starter/data/dtos/responses/game_list_response.dart';
import 'package:retrofit/retrofit.dart';

import '../network/api_client.dart';


abstract class RemoteDataSource {
  Future<HttpResponse<GameListResponse>> getGames({required int page, required String search});

  Future<HttpResponse<GameDTO>> getGameDetail({required int id});

}

class RemoteDataSourceImplementation implements RemoteDataSource {
  final ApiClient _appServiceClient;

  RemoteDataSourceImplementation(this._appServiceClient);


  @override
  Future<HttpResponse<GameListResponse>> getGames({required int page,required String search}) async{
    return await _appServiceClient.getGames(page: page,search: search);
  }

  @override
  Future<HttpResponse<GameDTO>> getGameDetail({required int id}) async {
    return await _appServiceClient.getGameDetail(id: id);

  }
}


