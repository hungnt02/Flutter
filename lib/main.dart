// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Page(),
      },
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<StatefulWidget> createState() {
    return CounterPageState();
  }
}

class MyObject {
  int value;
  MyObject(this.value);

  int get _value => value;
  set(newValue) => value = newValue;

  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  double square() {
    return sqrt(value);
  }

  int power(int exponent) {
    return value ^ exponent;
  }
}

class CounterPageState extends State<Page> {
  // MyObject myObject(0);
  int n = 0;
  MyObject myObject = MyObject(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Current value:  ${myObject._value}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                  onPressed: () {
                    myObject.decrease();
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Down')),
              const SizedBox(width: 5),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.increase();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text('Up'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'input N: '),
                onChanged: (value) {
                  n = int.parse(value);
                },
              ),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.power(n);
                  setState(() {});
                },
                icon: const Icon(Icons.edit_square),
                label: const Text('Multiply exponentially'),
              )
            ],
          )
        ],
      )),
    );
  }
}
