import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  final control = TextEditingController();

  Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Поиск',
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color.fromARGB(50, 250, 80, 1000),
      ),
      controller: control,
    );
  }
}
