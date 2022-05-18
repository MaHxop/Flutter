import 'package:dz1/widget/home/view_builder.dart';
import 'package:dz1/widget/home/film_column.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 1;
  static const List<Widget> _page = <Widget>[
    // FilmColumn(),
    GridViewBuilder(),
  ];

  void _onTab(int index) {
    if (_tab == index) return;
    setState(() {
      _tab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Center(
        child: _page[_tab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_queue), label: 'ListView'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_queue), label: 'GridView'),
        ],
        onTap: _onTab,
      ),
    );
  }
}
