import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  List<Film> filmList = [
    Film(
        image: Image.network(
            'https://c.wallhere.com/photos/22/27/2560x1600_px_landscape_nature-1077192.jpg!d'),
        name: 'name',
        language: 'language'),
    Film(
        image: Image.network(
            'https://c.wallhere.com/photos/22/27/2560x1600_px_landscape_nature-1077192.jpg!d'),
        name: 'name',
        language: 'language'),
    Film(
        image: Image.network(
            'https://c.wallhere.com/photos/22/27/2560x1600_px_landscape_nature-1077192.jpg!d'),
        name: 'name',
        language: 'language'),
    Film(
        image: Image.network(
            'https://c.wallhere.com/photos/22/27/2560x1600_px_landscape_nature-1077192.jpg!d'),
        name: 'name',
        language: 'language'),
  ];

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Center(
          child: Text('AppBar'),
        ),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.white38,
          child: Column(
            children: [
              FilmColumn(filmList: filmList),
            ],
          ),
        ),
      ),
    );
  }
}

class FilmColumn extends StatelessWidget {
  List<Film> filmList;

  FilmColumn({
    Key? key,
    required this.filmList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: filmList.map((data) => FilmCard(data: data)).toList(),
    );
  }
}

class FilmCard extends StatelessWidget {
  final Film data;

  const FilmCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Image(data.image),
        Text(data.name),
        Text(data.language),
      ],
    );
  }
}

class Film {
  final Image image;
  final String name;
  final String language;

  const Film({
    required this.image,
    required this.name,
    required this.language,
  });
}
