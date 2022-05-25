import 'package:dz1/bloc/home_bloc/home_bloc.dart';
import 'package:dz1/bloc/home_bloc/home_event.dart';
import 'package:dz1/bloc/home_bloc/home_state.dart';
import 'package:dz1/const/const.dart';
import 'package:dz1/const/timer.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
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
      ),
      body: RefreshIndicator(
        key: HomeScreen.globalKey,
        child: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (oldState, newState) => oldState.data != newState.data,
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
    return Image.network(Query.pisecImageUrl, fit: BoxFit.cover);
  }
}

class _Empty extends StatelessWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(Query.nothingImageUrl, fit: BoxFit.cover);
  }
}
