import 'package:dz1/const/film_class.dart';
import 'package:flutter/material.dart';

class HomeModel {
  final List<FilmModel>? docs;

  HomeModel(this.docs);
}

class FilmModel extends Film {
  LanguageEnum lang;

  FilmModel({
    required int id,
    required String title,
    required String picture,
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
