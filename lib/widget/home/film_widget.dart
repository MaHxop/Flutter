import 'package:dz1/const/film_class.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:dz1/widget/home/list_widget_film.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilmWidget extends StatefulWidget {
  final FilmPoster film;

  const FilmWidget({
    Key? key,
    required this.film,
  }) : super(
          key: key,
        );

  @override
  State<FilmWidget> createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  get filmList => FilmColumnState;
  bool heart = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        widget.film.picture,
        Container(
          color: Colors.white,
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.film.title),
              Text(widget.film.releaseDate),
              Text(widget.film.lang.toPrettyString()),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/HomePage/PageFilmInformation',
                    arguments: PageArgument(widget.film),
                  );
                },
                child: const Text('Подробности'),
              ),
            ],
          ),
        ),
        Positioned(
          top: 7,
          right: 7,
          child: GestureDetector(
            onTap: () {
              heart = !heart;
              setState(() {});
            },
            child: Icon(
              !heart ? Icons.heart_broken : Icons.favorite,
              color: !heart ? Colors.grey : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
