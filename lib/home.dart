import 'dart:convert';

import 'package:api_pluter/article.dart';
import 'package:api_pluter/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliverNavBarApp extends StatelessWidget {
  const SliverNavBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SliverNavBarExample(),
    );
  }
}

class SliverNavBarExample extends StatelessWidget {
  const SliverNavBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // A ScrollView that creates custom scroll effects using slivers.
      child: CustomScrollView(
        // A list of sliver widgets.
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            // leading: Icon(CupertinoIcons.person_2),
            // This title is visible in both collapsed and expanded states.
            // When the "middle" parameter is omitted, the widget provided
            // in the "largeTitle" parameter is used instead in the collapsed state.
            largeTitle: Text('Explore'),
            // trailing: Icon(CupertinoIcons.add_circled),
          ),
          // SliverFillRemaining(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       const Text('Drag me up', textAlign: TextAlign.center),
          //       CupertinoButton.filled(
          //         onPressed: () {
          //           Navigator.push(
          //             context,
          //             CupertinoPageRoute<Widget>(
          //               builder: (BuildContext context) {
          //                 return const NextPage();
          //               },
          //             ),
          //           );
          //         },
          //         child: const Text('Go to Next Page'),
          //       ),
          //     ],
          //   ),
          // ),
          FutureBuilder(
            future: getArticles(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final List<Article> articles = snapshot.data!;
                    return ListView.builder(
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(
                            articles[index].urlToImage ?? "",
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.red,
                                width: 80,
                                height: 80,
                              );
                            },
                          ),
                          title: Text(articles[index].title ?? ""),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else {
                    return const Center(child: Text("No data"));
                  }
              }
            },
          )
        ],
      ),
    );
  }

  Future<List<Article>> getArticles() async {
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=3c1a3d55326a4307a86978b745894d5d";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<Article> articles = [];
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      final articlesData = body['articles'] as List<dynamic>;
      articlesData.forEach((articleData) {
        articles.add(Article.fromMap(articleData));
      });
      return articles;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            backgroundColor: CupertinoColors.systemYellow,
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            // The middle widget is visible in both collapsed and expanded states.
            middle: const Text('Contacts Group'),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle: const Text('Family'),
          ),
          const SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Drag me up', textAlign: TextAlign.center),
                // When the "leading" parameter is omitted on a route that has a previous page,
                // the back button is automatically added to the leading position.
                Text('Tap on the leading button to navigate back',
                    textAlign: TextAlign.center),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
