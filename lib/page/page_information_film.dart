import 'package:flutter/material.dart';

class PageFilmInformation extends StatefulWidget {
  const PageFilmInformation({Key? key}) : super(key: key);

  @override
  State<PageFilmInformation> createState() => _PageFilmInformationState();
}

class _PageFilmInformationState extends State<PageFilmInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробности'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Container(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
