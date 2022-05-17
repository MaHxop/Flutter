import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:dz1/widget/home/view_builder.dart';
import 'package:flutter/material.dart';

class FilmColumn extends StatefulWidget {
  const FilmColumn({Key? key}) : super(key: key);

  @override
  State<FilmColumn> createState() => FilmColumnState();
}

class FilmColumnState extends State<FilmColumn> {
  List<FilmModel> filmList = FilmList.filmList;
  List<FilmModel> filterFilm = [];
  @override
  void initState() {
    super.initState();
    searchFilm();
    control.addListener(searchFilm);
  }

  final TextEditingController control = TextEditingController();

  void searchFilm() {
    final query = control.text;
    if (query.isNotEmpty) {
      filterFilm = filmList.where((FilmModel filmPoster) {
        return filmPoster.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterFilm = filmList;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              color: const Color.fromARGB(50, 250, 50, 1000),
              child: Column(
                children: List.generate(
                  filterFilm.length,
                  (int index) => FilmCard.model(model: filterFilm[index]),
                ),
              ),
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          controller: control,
          decoration: const InputDecoration(
            labelText: 'Поиск',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color.fromARGB(50, 250, 80, 1000),
          ),
        ),
      ],
    );
  }
}
