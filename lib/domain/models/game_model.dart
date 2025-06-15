


class GameModel{
  int id;
  String name;
  String released;
  String backgroundImage;
  double rating;
  int ratingTop;
  int ratingsCount;
  int reviewsTextCount;
  int added;
  int metacritic;
  int playtime;
  int suggestionsCount;
  String updated;
  int reviewsCount;

  GameModel({required this.id,required this.name,required this.added,required this.backgroundImage,required this.metacritic,required this.playtime,required this.rating,required this.ratingsCount,required this.ratingTop,required this.released,required this.reviewsCount,required this.reviewsTextCount,required this.suggestionsCount,required this.updated});
}