import 'package:flutter/material.dart';

abstract class Film {
  final int id;
  final String title;
  final Image picture;
  final double voteAverage;
  final String releaseDate;
  final String description;

  Film({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
  });
}

class FilmPoster extends Film {
  LanguageEnum lang;

  FilmPoster({
    required int id,
    required String title,
    required Image picture,
    required double voteAverage,
    required String releaseDate,
    required String description,
    required this.lang,
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
        );
}

enum LanguageEnum {
  russian,
  korean,
}

extension LanguageToFilm on LanguageEnum {
  String toPrettyString() {
    switch (this) {
      case LanguageEnum.russian:
        return 'Русский';
      case LanguageEnum.korean:
        return 'Корейский';
    }
  }
}
