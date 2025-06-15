


import 'package:flutter_project_starter/domain/models/game_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_dto.g.dart';

@JsonSerializable()
class GameDTO {
  int? id;
  String? slug;
  String? name;
  String? released;
  bool? tba;
  @JsonKey(name: "background_image")
  String? backgroundImage;
  double? rating;
  @JsonKey(name: "rating_top")
  int? ratingTop;
  List<GameRatingDTO>? ratings;
  @JsonKey(name: "ratings_count")
  int? ratingsCount;
  @JsonKey(name: "reviews_text_count")
  int? reviewsTextCount;
  int? added;
  int? metacritic;
  int? playtime;
  @JsonKey(name: "suggestions_count")
  int? suggestionsCount;
  String? updated;
  @JsonKey(name: "reviews_count")
  int? reviewsCount;

  GameDTO();

  factory GameDTO.fromJson(Map<String,dynamic> json) => _$GameDTOFromJson(json);

  Map<String,dynamic> toJson() => _$GameDTOToJson(this);

  GameModel toModel(){
    return GameModel(id: id ?? 0, name: name ?? "", added: added ?? 0, backgroundImage: backgroundImage ?? "", metacritic: metacritic ?? 0, playtime: playtime ?? 0, rating: rating ?? 0, ratingsCount: ratingsCount ?? 0, ratingTop: ratingTop ?? 0, released: released ?? "", reviewsCount: reviewsCount ?? 0, reviewsTextCount: reviewsTextCount ?? 0, suggestionsCount: suggestionsCount ?? 0, updated: updated ?? "");
  }


}

@JsonSerializable()
class GameRatingDTO{
  int? id;
  String? title;
  int? count;
  double? percent;

  GameRatingDTO();

  factory GameRatingDTO.fromJson(Map<String,dynamic> json) => _$GameRatingDTOFromJson(json);

  Map<String,dynamic> toJson() => _$GameRatingDTOToJson(this);
}