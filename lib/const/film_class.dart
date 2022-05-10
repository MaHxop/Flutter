import 'package:flutter/material.dart';

abstract class Film {
  final Image img;
  final String name;
  final String year;

  Film({
    required this.img,
    required this.name,
    required this.year,
  });
}

class FilmPoster extends Film {
  Image img;
  String name;
  String year;
  LanguageEnum lang;

  FilmPoster({
    language,
    required this.img,
    required this.name,
    required this.year,
    required this.lang,
  }) : super(
          img: img,
          name: name,
          year: year,
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
