import 'package:dz1/raznoe/film.dart';
import 'package:flutter/material.dart';
import 'test.dart';

/// Вторая страница

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  State<PageTwo> createState() => _PageTwoState();
}

/// Отображение информации о фильме

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробности'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
