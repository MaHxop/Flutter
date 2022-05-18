import 'package:dz1/const/api.dart';
import 'package:dz1/const/timer.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<HomeModel?>? dataLoadingState;
  List<FilmModel> filterFilm = [];
  final TextEditingController control = TextEditingController();

  void initState() {
    super.initState();
    // searchFilm();
    // control.addListener(searchFilm);
  }

  @override
  void didChangeDependencies() {
    dataLoadingState ??= FilmRepositories.loadData(
      context,
      q: Query.baseQuery,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.text,
            controller: control,
            decoration: const InputDecoration(
              labelText: 'Поиск',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Color.fromARGB(50, 250, 80, 1000),
            ),
            onChanged: _onSearchFieldTextChanged,
          ),
          Expanded(
            child: FutureBuilder<HomeModel?>(
              future: dataLoadingState,
              builder: (BuildContext context, AsyncSnapshot<HomeModel?> data) {
                return data.connectionState != ConnectionState.done
                    ? const Center(child: CircularProgressIndicator())
                    : data.hasData
                        ? ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return FilmCard(
                                filmModel: data.data!.docs![index],
                                key: ValueKey<int>(data.data!.docs![index].id),
                              );
                            },
                            itemCount: data.data!.docs!.length,
                          )
                        : const Center(child: Text('Всё! Кина не будет'));
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      dataLoadingState = FilmRepositories.loadData(
        context,
        q: text.isNotEmpty ? text : Query.baseQuery,
      );
      setState(() {});
    });
  }

  // void searchFilm() {
  //   final query = control.text;
  //   if (query.isNotEmpty) {
  //     filterFilm = filmList.where((FilmModel filmPoster) {
  //       return filmPoster.title.toLowerCase().contains(query.toLowerCase());
  //     }).toList();
  //   } else {
  //     filterFilm = filmList;
  //   }
  //   setState(() {});
  // }
}
