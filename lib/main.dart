import 'package:dz1/dz2.dart';
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
      },
      initialRoute: '/HomePage',
    );
  }
}
