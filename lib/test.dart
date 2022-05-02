import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_two.dart';

/// Домашняя страница на которой отрисовывается список фильмов в виде виджетов

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Главная страница'),
        ),
      ),
      body: const FilmColumn(),
    );
  }
}

class FilmColumn extends StatefulWidget {
  const FilmColumn({Key? key}) : super(key: key);

  @override
  State<FilmColumn> createState() => _FilmColumnState();
}

class _FilmColumnState extends State<FilmColumn> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(),
            ListFilmToWidget(
              filmWidgetList: filmList,
            ),
          ],
        ),
      ),
    );
  }
}

/// Абстрактный класс фильмов

abstract class FilmPoster {
  final Image img;
  final String name;
  final String year;

  FilmPoster({
    required this.img,
    required this.name,
    required this.year,
  });
}

/// Класс фильмов, наследуется от абстрактного, миксин на выбор языков

class Film extends FilmPoster {
  Image img;
  String name;
  String year;
  LanguageEnum lang;

  Film({
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

/// Перечисление возможных языков

enum LanguageEnum {
  russian,
  korean,
}

/// Миксин для выбора языка

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

/// Список в котором записаны экземпляры класса фильмов

List<Film> filmList = [
  Film(
    img: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
    name: 'Крепкий орешек',
    year: '1998',
    lang: LanguageEnum.korean,
  ),
  Film(
    img: Image.network(
        'https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg'),
    name: 'Терминатор',
    year: '1987',
    lang: LanguageEnum.russian,
  ),
];

/// Виджет который принимает экземпляр фильма и отрисовывает его на экране

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
        Container(
          color: const Color.fromARGB(50, 250, 50, 1000),
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(inform.name),
              Text(inform.year),
              Text(inform.lang.toPrettyString()),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/PageTwo');
                },
                child: const Text('Подробности'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Вдижет который преобразует список фильмов в список виджетов

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
