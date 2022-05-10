import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  List<Film>? filmList;

  @override
  void initState() {
    filmList = [
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(50, 250, 50, 1000),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Filter(),
              const SizedBox(height: 5),
              Column(
                children: filmList!
                    .map((listFilmToWidgetFilm) => FilmWidget(
                          inform: listFilmToWidgetFilm,
                        ))
                    .toList(),
              ),
            ],
          ),
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
                  Navigator.of(context).pushNamed('/HomePage/PageTwo');
                },
                child: const Text('Подробности'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class Filter extends StatelessWidget {
  final control = TextEditingController();

  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Поиск',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color.fromARGB(50, 250, 80, 1000),
      ),
      controller: control,
    );
  }
}
