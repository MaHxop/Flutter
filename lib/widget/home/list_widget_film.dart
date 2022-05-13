import 'package:dz1/const/film_class.dart';
import 'package:dz1/widget/home/film_widget.dart';
import 'package:dz1/widget/home/filter_widget.dart';
import 'package:flutter/material.dart';

class FilmColumn extends StatefulWidget {
  const FilmColumn({Key? key}) : super(key: key);

  @override
  State<FilmColumn> createState() => FilmColumnState();
}

class FilmColumnState extends State<FilmColumn> {
  List<FilmPoster>? filmList;

  @override
  void initState() {
    filmList = [
      FilmPoster(
        img: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
        name: 'Крепкий орешек',
        year: '1991',
        lang: LanguageEnum.korean,
      ),
      FilmPoster(
        img: Image.network(
            'https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg'),
        name: 'Терминатор',
        year: '1992',
        lang: LanguageEnum.russian,
      ),
      FilmPoster(
        img: Image.network(
            'https://kinocomment.ru/media/foto/2015/02/19/1011595766.jpg'),
        name: 'Достучаться до небес',
        year: '1993',
        lang: LanguageEnum.korean,
      ),
      FilmPoster(
        img: Image.network(
            'https://artfiles.alphacoders.com/987/thumb-1920-98733.jpg'),
        name: 'Гарри Поттер',
        year: '1994',
        lang: LanguageEnum.russian,
      ),
      FilmPoster(
        img: Image.network(
            'https://www.film.ru/sites/default/files/movies/posters/1616021-1581739.jpeg'),
        name: 'Чужой',
        year: '1995',
        lang: LanguageEnum.korean,
      ),
      FilmPoster(
        img: Image.network(
            'https://images.kinorium.com/movie/poster/77072/w1500_3573799.jpg'),
        name: 'Бегущий по лезвию',
        year: '1996',
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
