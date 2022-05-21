import 'package:dz1/const/widget/not_found_page.dart';
import 'package:dz1/page/main_page.dart';
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
      title: 'Flutter courses',
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

        return MaterialPageRoute(
          // Более короткая версия функции
          // (_, __, ___ и так далее) обозначают неиспользуемые параметры
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Color.fromARGB(50, 180, 10, 250),
//         ),
//         bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//           backgroundColor: Color.fromARGB(50, 180, 10, 200),
//           selectedItemColor: Colors.indigoAccent,
//           unselectedItemColor: Colors.purple,
//         )),
//     routes: {
//       '/': (context) => BlocProvider<ErrorBloc>(
//         lazy: false,
//         create: (_) => ErrorBloc(),
//         child: RepositoryProvider<FilmRepositories>(
//           lazy: true,
//           create: (BuildContext context) => FilmRepositories(
//             onErrorHandler: (String code, String message) {
//               context
//                   .read<ErrorBloc>()
//                   .add(ShowDialogEvent(title: code, message: message));
//             },
//           ),
//           child: BlocProvider<HomeBloc>(
//               lazy: false,
//               create: (BuildContext context) =>
//                   HomeBloc(context.read<FilmRepositories>()),
//               child: const HomeScreen()),
//         ),
//       ),
//       '/HomeScreen/PageFilmInformation': (context) => PageFilmInformation(
//         arg: ModalRoute.of(context)?.settings.arguments as PageArgument,
//       ),
//     },
//     initialRoute: '/',
//   );
// }
// }
