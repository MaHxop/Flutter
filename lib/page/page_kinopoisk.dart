import 'package:dz1/const/timer.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController control = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Stack(
        children: [
          const FutureBuild(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: TextField(
              controller: control,
              maxLines: 1,
              decoration: const InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FutureBuild extends StatefulWidget {
  const FutureBuild({Key? key}) : super(key: key);

  @override
  State<FutureBuild> createState() => _FutureBuildState();
}

class _FutureBuildState extends State<FutureBuild> {
  Future<HomeModel?>? dataLoadingState;

  @override
  void didChangeDependencies() {
    dataLoadingState ??= FilmRepositories.loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeModel?>(
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
    );
  }

  void _onSearchFieldTextChanged(String text) {
    DelayedAction.run(() {
      dataLoadingState = FilmRepositories.loadData();
      setState(() {});
    });
  }
}
