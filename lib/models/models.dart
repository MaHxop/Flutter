import 'package:dz1/data/db/database.dart';

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

/// Функция преобразования из [MovieFilmCardModel] в [FilmTableData]
extension FilmCardModelToDatabase on FilmModel {
  FilmTableData toDatabase() {
    return FilmTableData(
      id: id,
      title: title,
      picture: picture,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      description: description,
    );
  }
}

/// Функция преобразования из [FilmTableData] в [FilmCardModel]
extension MovieTableDataToDomain on FilmTableData {
  FilmModel toDomain() {
    return FilmModel(
      id: id,
      title: title,
      picture: picture ?? '',
      releaseDate: releaseDate ?? '',
      voteAverage: voteAverage ?? 0.0,
      description: description ?? '',
    );
  }
}
