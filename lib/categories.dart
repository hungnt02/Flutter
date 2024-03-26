import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Flutter code sample for [ActionChoice].

class ChipApp extends StatelessWidget {
  const ChipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const ActionChoiceExample(),
    );
  }
}

class ActionChoiceExample extends StatefulWidget {
  const ActionChoiceExample({super.key});

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Choose an item', style: textTheme.labelLarge),
            const SizedBox(height: 10.0),
            Wrap(
              spacing: 5.0,
              children: List<Widget>.generate(
                3,
                (int index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selected: _value == index,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : null;
                      });
                    },
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
