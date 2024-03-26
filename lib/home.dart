import 'package:api_pluter/home_screen.dart';
import 'package:api_pluter/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverFillRemainingExampleApp extends StatelessWidget {
  const SliverFillRemainingExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        const SliverToBoxAdapter(
          child: SearchBarApp(),
        ),
        Row(
          children: [
            ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Text('All'),
                  width: 100,
                )
              ],
            )
          ],
        ),
        const SliverFillRemaining(
          child: HomeScreen(),
        )
      ],
    );
  }
}
