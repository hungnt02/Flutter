import 'dart:math';

import 'package:api_pluter/article.dart';
import 'package:api_pluter/detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomePage();
}

class HomePage extends State<Home> {
  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              'Mon, 5th September 2024',
              style: TextStyle(
                  fontFamily: AutofillHints.birthdayDay, fontSize: 13),
              textAlign: TextAlign.left,
            )),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: const Text(
              'Explore',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
        SearchAnchor(
            builder: (BuildContext context, SearchController controller) {
          return Container(
              height: 60,
              padding: EdgeInsets.all(10),
              child: SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 10.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Row(
                  children: [Icon(Icons.search), Text('  Search for article')],
                ),
              ));
        }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
          return List<ListTile>.generate(5, (int index) {
            final String item = 'item $index';
            return ListTile(
              title: Text(item),
              onTap: () {
                // setState(() {
                //   controller.closeView(item);
                // });
              },
            );
          });
        }),
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          scrollDirection: Axis.horizontal,
          child: Wrap(spacing: 5.0, direction: Axis.horizontal, children: [
            ChoiceChip(
              label: Text('All'),
              selected: _value == 0,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? 0 : 0;
                });
              },
            ),
            ChoiceChip(
              label: Text('Politic'),
              selected: _value == 1,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? 1 : 0;
                });
              },
            ),
            ChoiceChip(
              label: Text('Sports'),
              selected: _value == 2,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? 2 : 0;
                });
              },
            ),
            ChoiceChip(
              label: Text('Health'),
              selected: _value == 3,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? 3 : 0;
                });
              },
            ),
            ChoiceChip(
              label: Text('Other'),
              selected: _value == 4,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? 4 : 0;
                });
              },
            ),
          ]),
        ),
        Expanded(
          child: FutureBuilder<List<Article>>(
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
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Detail(article: articles[index])),
                            );
                          },
                          child: ListTile(
                            leading: Image.network(
                              fit: BoxFit.contain,
                              articles[index].urlToImage ?? "",
                              width: 100,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  // child: Image.asset('assets/images/img1.jpg'),
                                  width: 0,
                                  height: 0,
                                );
                              },
                            ),
                            title: Text(articles[index].title ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ),
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
          ),
        )
      ],
    )));
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
      final List<Article> result = [];
      articles.forEach((element) {
        if (element.urlToImage != null && element.title != "[Removed]") {
          result.add(element);
        }
      });
      return result;
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
