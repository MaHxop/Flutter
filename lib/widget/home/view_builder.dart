import 'package:dz1/const/api.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:flutter/material.dart';

class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({Key? key}) : super(key: key);

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
  Future<HomeModel?>? dataLoadingState;

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
    return Stack(
      children: [
        FutureBuilder<HomeModel?>(
          future: dataLoadingState,
          builder: (BuildContext context, AsyncSnapshot<HomeModel?> data) {
            return data.connectionState != ConnectionState.done
                ? const Center(child: CircularProgressIndicator())
                : data.hasData
                    ? GridView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return FilmCard(
                            filmModel: data.data!.docs![index],
                            key: ValueKey<int>(data.data!.docs![index].id),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: data.data!.docs!.length,
                      )
                    : const Center(child: Text('Всё! Кина не будет'));
          },
        ),
      ],
    );
  }
}
