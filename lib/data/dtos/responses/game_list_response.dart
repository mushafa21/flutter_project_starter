

import 'package:flutter_project_starter/data/dtos/game_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_list_response.g.dart';


@JsonSerializable()
class GameListResponse{
  List<GameDTO>? results;

  GameListResponse();

  factory GameListResponse.fromJson(Map<String,dynamic> json) => _$GameListResponseFromJson(json);

  Map<String,dynamic> toJson() => _$GameListResponseToJson(this);
}