import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'page_two.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(50, 150, 10, 1000),
      )),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/PageTwo': (context) => const PageTwo(),
      },
      initialRoute: '/HomePage',
    );
  }
}

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
      body: Center(
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
    );
  }
}

/// Абстрактный класс фильмов

abstract class FilmPoster {
  final Image img;
  final String name;
  final String year;
  LanguageEnum? language;

  FilmPoster({
    required this.img,
    required this.name,
    required this.year,
    required this.language,
  });
}

/// Класс фильмов, наследуется от абстрактного, миксин на выбор языков

class Film extends FilmPoster {
  Image img;
  String name;
  String year;

  Film({
    language,
    required this.img,
    required this.name,
    required this.year,
  }) : super(
          img: img,
          name: name,
          year: year,
          language: language,
        );
}

/// Перечисление возможных языков

enum LanguageEnum {
  russian,
  korean,
}

/// Миксин для выбора языка

// mixin LanguageToFilm {
//   LanguageEnum? SelectLanguage(String language) {
//     switch (language) {
//       case 'Русский':
//         return LanguageEnum.russian;
//       case 'Корейский':
//         return LanguageEnum.korean;
//     }
//   }
// }

/// Список в котором записаны экземпляры класса фильмов

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
    year: '1987',
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
    void pressButton() {
      Navigator.of(context).pushNamed('/PageTwo');
    }

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
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: pressButton,
                child: const Text('Подробности'),
              )
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
