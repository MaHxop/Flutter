import 'package:dz1/page/home_page.dart';
import 'package:dz1/page/page_information_film.dart';
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
        backgroundColor: Color.fromARGB(50, 150, 10, 1000),
      )),
      routes: {
        '/HomePage': (context) => const HomePage(),
        '/HomePage/PageFilmInformation': (context) => PageFilmInformation(
              arg: ModalRoute.of(context)?.settings.arguments as PageArgument,
            ),
      },
      initialRoute: '/HomePage',
    );
  }
}
