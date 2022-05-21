import 'package:dz1/blok/home_blok/home_blok.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/error_blok/error_blok.dart';
import 'package:dz1/error_blok/error_event.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:dz1/page/page_kinopoisk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            backgroundColor: Color.fromARGB(50, 180, 10, 200),
            selectedItemColor: Colors.indigoAccent,
            unselectedItemColor: Colors.purple,
          )),
      routes: {
        '/': (context) => BlocProvider<ErrorBloc>(
              lazy: false,
              create: (_) => ErrorBloc(),
              child: RepositoryProvider<FilmRepositories>(
                lazy: true,
                create: (BuildContext context) => FilmRepositories(
                  onErrorHandler: (String code, String message) {
                    context
                        .read<ErrorBloc>()
                        .add(ShowDialogEvent(title: code, message: message));
                  },
                ),
                child: BlocProvider<HomeBloc>(
                    lazy: false,
                    create: (BuildContext context) =>
                        HomeBloc(context.read<FilmRepositories>()),
                    child: const HomeScreen()),
              ),
            ),
        '/HomeScreen/PageFilmInformation': (context) => PageFilmInformation(
              arg: ModalRoute.of(context)?.settings.arguments as PageArgument,
            ),
      },
      initialRoute: '/',
    );
  }
}
