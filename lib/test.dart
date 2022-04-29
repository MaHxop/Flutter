import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListFilmToWidget(
                  filmWidgetList: filmList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Film {
  final Image img;
  final String name;
  final String year;

  Film({
    required this.img,
    required this.name,
    required this.year,
  });
}

List<Film> filmList = [
  Film(
    img: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
    name: 'Крепкий орешек',
    year: '1998',
  ),
  Film(
    img: Image.network(
        'https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg'),
    name: 'Терминатор',
    year: '1998',
  ),
];

class FilmWidget extends StatelessWidget {
  final Film inform;

  const FilmWidget({
    Key? key,
    required this.inform,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        inform.img,
        Text(inform.name),
        Text(inform.year),
      ],
    );
  }
}

class ListFilmToWidget extends StatelessWidget {
  List<Film> filmWidgetList;

  ListFilmToWidget({
    Key? key,
    required this.filmWidgetList,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: filmWidgetList
          .map((listFilmToWidgetFilm) => FilmWidget(
                inform: listFilmToWidgetFilm,
              ))
          .toList(),
    );
  }
}
