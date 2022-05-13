import 'package:dz1/const/film_class.dart';
import 'package:dz1/widget/home/list_widget_film.dart';
import 'package:flutter/material.dart';

class FilmWidget extends StatelessWidget {
  final FilmPoster inform;

  const FilmWidget({
    Key? key,
    required this.inform,
  }) : super(
          key: key,
        );

  get filmList => FilmColumnState;

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
                  Navigator.pushNamed(
                    context,
                    '/HomePage/PageFilmInformation',
                  );
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
