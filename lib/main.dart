import 'package:dz1/film.dart';

void main() {
  FilmData film = FilmData(language: 'Французский');
  print(film.stringToLang(film.language ?? ''));
  List<FilmData> filmList = FilmData.testFilm;
  ratingFilm(filmList);
}
