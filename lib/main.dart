import 'package:api_pluter/home.dart';
import 'package:api_pluter/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text('Eplore',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23))),
      body: const SliverFillRemainingExampleApp(),
    ));
  }
}
