import 'package:flutter/material.dart';

abstract class Film {
  final int? id;
  final String? title;
  final Image? picture;
  final double? voteAverage;
  final String? releaseDate;
  final String? description;
  final String? language;

  Film({
    this.id,
    this.title,
    this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
    this.language,
  });
}

mixin StringToLanguage {
  Language? stringToLang(String language) {
    switch (language) {
      case 'Русский':
        return Language.russian;
      case 'Китайский':
        return Language.chinese;
      case 'Английский':
        return Language.english;
      case 'Корейский':
        return Language.korean;
      case 'Японский':
        return Language.japanese;
      case 'Французский':
        return Language.french;
      default:
        return null;
    }
  }
}

enum Language {
  russian,
  chinese,
  english,
  korean,
  japanese,
  french,
}

class FilmData extends Film with StringToLanguage {
  FilmData({
    int? id,
    String? title,
    Image? picture,
    double? voteAverage,
    String? releaseDate,
    String? description,
    String? language,
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
        );

  }

   List<FilmData> get testFilm => [
        FilmData(
            id: 1,
            title: 'Крепкий орешек',
            picture: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
            voteAverage: 5.3,
            releaseDate: '1988 год',
            language: 'Японский'),
        FilmData(
            id: 2,
            title: 'Терминатор',
            picture: Image.network('https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg'),
            voteAverage: 7.7,
            releaseDate: '1984 год',
            language: 'Английский'),
        FilmData(
            id: 3,
            title: 'Поврот не туда',
            picture: Image.network('https://i.pinimg.com/originals/87/18/d1/8718d1dcd7b8dd2a6bc77a57fe2c02d3.jpg'),
            voteAverage: 2.5,
            releaseDate: '2003 год',
            language: 'Русский'),
        FilmData(
            id: 4,
            title: 'Человек-Паук',
            picture: Image.network('https://static-europaplus.cdnvideo.ru/upload/67/67834e54f1a9afb6cedf12beeb829e45.jpg'),
            voteAverage: 4.5,
            releaseDate: '2002 год',
            language: 'Китайский'),
        FilmData(
            id: 5,
            title: 'Олдбой',
            picture: Image.network('https://trueposters.ru/pictures/product/big/5768_big.jpg'),
            voteAverage: 9.1,
            releaseDate: '2003 год',
            language: 'Корейский'),
        FilmData(
            id: 6,
            title: 'Достучаться до небес',
            picture: Image.network('https://kinocomment.ru/media/foto/2015/02/19/1011595766.jpg'),
            voteAverage: 8.0,
            releaseDate: '1997 год',
            language: 'Французский'),
      ];
}

Future<List> premiereFilms() async {
  List<String> nameFilm = [
    'Крепкий орешек',
    'Терминатор',
    'Поврот не туда',
    'Человек-Паук',
    'Олдбой',
    'Достучаться до небес'
  ];
  await Future.delayed(const Duration(seconds: 2), () => print(nameFilm));
  return nameFilm;
}

void ratingFilm(List<FilmData> filmList) {
  final vote = filmList
      .where((FilmData element) =>
          (element.id ?? 0) >= 5 && (element.voteAverage ?? 0) >= 8.5)
      .toList();
  for (final a in vote) {
    a.information();
  }
}
