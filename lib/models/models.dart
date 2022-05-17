class HomeModel {
  final List<FilmModel>? docs;

  HomeModel({this.docs});
}

class FilmModel {
  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  FilmModel({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
  });
}
