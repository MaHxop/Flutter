import 'package:dz1/const/widget/not_found_page.dart';
import 'package:dz1/page/main_page.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:dz1/page/setting_page.dart';
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
      ),
      initialRoute: MainPage.path,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }

        if (settings.name == SettingsPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const SettingsPage();
            },
          );
        }

        if (settings.name == PageFilmInformation.path) {
          return MaterialPageRoute(
            builder: (context) {
              return PageFilmInformation(
                arg: ModalRoute.of(context)?.settings.arguments as PageArgument,
              );
            },
          );
        }

        return MaterialPageRoute(
          // Более короткая версия функции
          // (_, __, ___ и так далее) обозначают неиспользуемые параметры
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}
