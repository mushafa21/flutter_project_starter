

import 'package:flutter_project_starter/domain/models/game_model.dart';

class GameEntity{
  int id;
  String name;
  String backgroundImage;

  GameEntity({required this.id,required this.name,required this.backgroundImage});

  // Convert a GameEntity into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'backgroundImage': backgroundImage,
    };
  }

  // Create a GameEntity from a Map.
  factory GameEntity.fromMap(Map<String, dynamic> map) {
    return GameEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      backgroundImage: map['backgroundImage'] as String,
    );
  }

  GameModel toModel(){
    return GameModel(id: id, name: name, added: 0, backgroundImage: backgroundImage, metacritic: 0, playtime: 0, rating: 0, ratingsCount: 0, ratingTop: 0, released: "", reviewsCount: 0, reviewsTextCount: 0, suggestionsCount: 0, updated: "");
  }
}