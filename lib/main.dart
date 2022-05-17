import 'package:dz1/page/home_page.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:dz1/page/page_kinopoisk.dart';
import 'package:dz1/widget/home/view_builder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(50, 180, 10, 250),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromARGB(50, 180, 10, 250),
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Colors.purple,
          )),
      routes: {
        '/': (context) => const HomeScreen(),
        '/HomePage': (context) => const HomePage(),
        '/HomePage/ViewBuilder': (context) => const ListViewBuilder(),
        '/HomePage/PageFilmInformation': (context) => PageFilmInformation(
              arg: ModalRoute.of(context)?.settings.arguments as PageArgument,
            ),
      },
      initialRoute: '/',
    );
  }
}
