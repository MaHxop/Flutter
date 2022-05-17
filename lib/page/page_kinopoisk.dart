// import 'package:dz1/data/repositories/repositories.dart';
// import 'package:dz1/models/models.dart';
// import 'package:dz1/widget/home/film_card.dart';
// import 'package:dz1/widget/home/film_column.dart';
// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: FutureBuilder<FilmModel?>(
//         future: FilmRepositories.loadData(),
//         builder: (BuildContext context, AsyncSnapshot<FilmModel?> data) {
//           return data.hasData
//               ? ListView.builder(
//                   itemBuilder: (BuildContext context, int index) {
//                     return FilmCard(
//                       filmModel: data.data?.docs[index],
//                       key: ValueKey<int>(data.data?.docs[index].id ?? -1),
//                     );
//                   },
//                   itemCount: data.data?.docs.lenght ?? 0,
//                 )
//               : const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
