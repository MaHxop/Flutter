import 'package:dz1/widget/home/list_widget_film.dart';
import 'package:flutter/material.dart';

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
