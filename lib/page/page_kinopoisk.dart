import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_card.dart';
import 'package:dz1/widget/home/film_column.dart';
import 'package:dz1/widget/home/view_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<HomeModel?>? dataLoadingState;

  // int _tab = 1;
  // static const List<Widget> _page = <Widget>[
  //   GridViewBuilder(),
  //   FilmColumn(),
  // ];

  // void _onTab(int index) {
  //   if (_tab == index) return;
  //   setState(() {
  //     _tab = index;
  //   });
  // }

  @override
  void didChangeDependencies() {
    dataLoadingState ??= FilmRepositories.loadData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная страница'),
      ),
      body: Center(
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _tab,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add_to_queue), label: 'ListView'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.add_to_queue), label: 'GridView'),
      //   ],
      //   onTap: _onTab,
      // ),
    );
  }
}
