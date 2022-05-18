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
  final TextEditingController control = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dataLoadingState ??= FilmRepositories.loadData(
      context,
      title: Query.baseQuery,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Stack(
        children: [
          FutureBuilder<HomeModel?>(
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
            setState(() {});
          },
        );
      },
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      dataLoadingState = FilmRepositories.loadData(
        context,
        title: text.isNotEmpty ? text : Query.baseQuery,
      );
      setState(() {});
    });
  }
}
