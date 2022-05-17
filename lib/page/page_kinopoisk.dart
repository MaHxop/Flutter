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

  @override
  void didChangeDependencies() {
    dataLoadingState ??= FilmRepositories.loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}
