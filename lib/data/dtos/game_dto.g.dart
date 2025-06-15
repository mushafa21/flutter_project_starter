// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameDTO _$GameDTOFromJson(Map<String, dynamic> json) =>
    GameDTO()
      ..id = (json['id'] as num?)?.toInt()
      ..slug = json['slug'] as String?
      ..name = json['name'] as String?
      ..released = json['released'] as String?
      ..tba = json['tba'] as bool?
      ..backgroundImage = json['background_image'] as String?
      ..rating = (json['rating'] as num?)?.toDouble()
      ..ratingTop = (json['rating_top'] as num?)?.toInt()
      ..ratings =
          (json['ratings'] as List<dynamic>?)
              ?.map((e) => GameRatingDTO.fromJson(e as Map<String, dynamic>))
              .toList()
      ..ratingsCount = (json['ratings_count'] as num?)?.toInt()
      ..reviewsTextCount = (json['reviews_text_count'] as num?)?.toInt()
      ..added = (json['added'] as num?)?.toInt()
      ..metacritic = (json['metacritic'] as num?)?.toInt()
      ..playtime = (json['playtime'] as num?)?.toInt()
      ..suggestionsCount = (json['suggestions_count'] as num?)?.toInt()
      ..updated = json['updated'] as String?
      ..reviewsCount = (json['reviews_count'] as num?)?.toInt();

Map<String, dynamic> _$GameDTOToJson(GameDTO instance) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'name': instance.name,
  'released': instance.released,
  'tba': instance.tba,
  'background_image': instance.backgroundImage,
  'rating': instance.rating,
  'rating_top': instance.ratingTop,
  'ratings': instance.ratings,
  'ratings_count': instance.ratingsCount,
  'reviews_text_count': instance.reviewsTextCount,
  'added': instance.added,
  'metacritic': instance.metacritic,
  'playtime': instance.playtime,
  'suggestions_count': instance.suggestionsCount,
  'updated': instance.updated,
  'reviews_count': instance.reviewsCount,
};

GameRatingDTO _$GameRatingDTOFromJson(Map<String, dynamic> json) =>
    GameRatingDTO()
      ..id = (json['id'] as num?)?.toInt()
      ..title = json['title'] as String?
      ..count = (json['count'] as num?)?.toInt()
      ..percent = (json['percent'] as num?)?.toDouble();

Map<String, dynamic> _$GameRatingDTOToJson(GameRatingDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'count': instance.count,
      'percent': instance.percent,
    };
