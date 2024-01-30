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
    return MaterialApp();
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

  int get _value => this.value;
  set _value(newValue) => this.value = newValue;

  void increase() {
    value++;
  }

  void decrease() {
    value--;
  }

  double square() {
    return sqrt(this.value);
  }

  int power(int exponent) {
    return value ^ exponent;
  }
}

class CounterPageState extends State<Page> {
  // MyObject myObject(0);
  int n = 0;
  MyObject myObject = new MyObject(0);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Hướng đối tượng'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Giá trị hiện tại:  ${myObject.value}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton.icon(
                  onPressed: () {
                    myObject.decrease();
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Giảm')),
              const SizedBox(width: 5),
              OutlinedButton.icon(
                onPressed: () {
                  myObject.increase();
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text('Tăng'),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Nhập số nguyên n'),
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
                label: const Text('Nhân luỹ thừa'),
              )
            ],
          )
        ],
      )),
    );
  }
}
