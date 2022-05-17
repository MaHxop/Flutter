import 'package:flutter/material.dart';

abstract class Film {
  final int id;
  final String title;
  final String picture;
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

enum LanguageEnum {
  russian,
  korean,
  english,
  chinese,
}

extension LanguageToFilm on LanguageEnum {
  String toPrettyString() {
    switch (this) {
      case LanguageEnum.russian:
        return 'Русский';
      case LanguageEnum.korean:
        return 'Корейский';
      case LanguageEnum.english:
        return 'Английский';
      case LanguageEnum.chinese:
        return 'Китайский';
    }
  }
}
