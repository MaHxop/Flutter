import 'package:dz1/blok/error_blok/error_blok.dart';
import 'package:dz1/blok/error_blok/error_event.dart';
import 'package:dz1/blok/home_blok/home_blok.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/page/page_kinopoisk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  static const path = '/';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
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
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
