import 'package:dz1/const/film_class.dart';
import 'package:dz1/widget/home/film_widget.dart';
import 'package:flutter/material.dart';

class PageArgument {
  final FilmPoster data;

  PageArgument(this.data);
}

class PageFilmInformation extends StatefulWidget {
  final PageArgument arg;
  const PageFilmInformation({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  State<PageFilmInformation> createState() => _PageFilmInformationState();
}

class _PageFilmInformationState extends State<PageFilmInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробности'),
      ),
      body: Column(
        children: [
          FilmWidget(
            film: widget.arg.data,
          ),
        ],
      ),
    );
  }
}
