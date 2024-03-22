import 'package:api_pluter/home_screen.dart';
import 'package:api_pluter/search.dart';
import 'package:flutter/material.dart';

class SliverFillRemainingExampleApp extends StatelessWidget {
  const SliverFillRemainingExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SearchBarApp(),
        ),
        SliverFillRemaining(
          child: HomeScreen(),
        )
      ],
    );
  }
}
