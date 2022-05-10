import 'package:dz1/const/film_class.dart';
import 'package:dz1/widget/home/film_widget.dart';
import 'package:dz1/widget/home/filter_widget.dart';
import 'package:flutter/material.dart';

class FilmColumn extends StatefulWidget {
  const FilmColumn({Key? key}) : super(key: key);

  @override
  State<FilmColumn> createState() => _FilmColumnState();
}

class _FilmColumnState extends State<FilmColumn> {
  List<FilmPoster>? filmList;

  @override
  void initState() {
    filmList = [
      FilmPoster(
        img: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
        name: 'Крепкий орешек',
        year: '1998',
        lang: LanguageEnum.korean,
      ),
      FilmPoster(
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
