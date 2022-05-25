import 'package:dz1/blok/home_blok/home_blok.dart';
import 'package:dz1/blok/home_blok/home_event.dart';
import 'package:dz1/blok/home_blok/home_state.dart';
import 'package:dz1/const/constants.dart';
import 'package:dz1/const/timer.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/page/setting_page.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  static final GlobalKey<State<StatefulWidget>> globalKey = GlobalKey();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<HomeModel?>? dataLoadingState;
  final TextEditingController control = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Главная страница')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(
                context,
                SettingsPage.path,
              );
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        key: HomeScreen.globalKey,
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: control,
              decoration: InputDecoration(
                labelText: 'Поиск',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor:
                    const Color.fromARGB(50, 250, 50, 200).withOpacity(0.3),
              ),
              onChanged: _onSearchFieldTextChanged,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (oldState, newState) =>
                  oldState.data != newState.data ||
                  // добавим что список будет перерисовывать при изменении
                  // списка избранных
                  oldState.favouritesFilm != newState.favouritesFilm,
              builder: (context, state) {
                return FutureBuilder<HomeModel?>(
                  future: state.data,
                  builder:
                      (BuildContext context, AsyncSnapshot<HomeModel?> data) {
                    return data.connectionState != ConnectionState.done
                        ? const Center(child: CircularProgressIndicator())
                        : data.hasData
                            ? data.data?.docs?.isNotEmpty == true
                                ? Expanded(
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        bool isFavourite = false;
                                        if (state.favouritesFilm?.isNotEmpty ==
                                            true) {
                                          var moviesFavourite = state
                                              .favouritesFilm
                                              ?.firstWhere((element) =>
                                                  element.id ==
                                                  data.data?.docs?[index].id);
                                          if (moviesFavourite != null) {
                                            isFavourite = true;
                                          }
                                        }

                                        return FilmCard(
                                          filmModel: data.data!.docs![index],
                                          key: ValueKey<int>(
                                              data.data!.docs![index].id),
                                        );
                                      },
                                      itemCount: data.data!.docs!.length,
                                    ),
                                  )
                                : const _Empty()
                            : const _Error();
                  },
                );
              },
            ),
          ],
        ),
        onRefresh: () {
          return Future.delayed(
            const Duration(seconds: 1),
            () {
              context.read<HomeBloc>().add(LoadDataEvent());
              setState(() {});
            },
          );
        },
      ),
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      context.read<HomeBloc>().add(SearchChangedEvent(search: text));
    });
  }
}

class _Error extends StatelessWidget {
  const _Error({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(Querys.pisecImageUrl, fit: BoxFit.cover);
  }
}

class _Empty extends StatelessWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(Querys.nothingImageUrl, fit: BoxFit.cover);
  }
}
