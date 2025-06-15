import 'package:dio/dio.dart';
import 'package:flutter_project_starter/data/dtos/game_dto.dart';
import 'package:flutter_project_starter/data/dtos/responses/game_list_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../app/constant.dart';

part 'api_client.g.dart';


@RestApi(baseUrl: baseApi, parser: Parser.JsonSerializable)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/games")
  Future<HttpResponse<GameListResponse>> getGames({@Query("page") required int page, @Query("search") required String search});

  @GET("/games/{id}")
  Future<HttpResponse<GameDTO>> getGameDetail({@Path("id") required int id});


}
