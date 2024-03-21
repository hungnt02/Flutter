import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:api_pluter/article.dart';

class HomeScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Explore",
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: Center(
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
          ),
        )
        // body: FutureBuilder<List<Article>>(
        //   future: getArticles(),
        //   builder: (context, snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //       case ConnectionState.active:
        //       case ConnectionState.waiting:
        //         return const Center(child: CircularProgressIndicator());
        //       case ConnectionState.done:
        //         if (snapshot.hasData) {
        //           final List<Article> articles = snapshot.data!;
        //           return ListView.builder(
        //             itemCount: articles.length,
        //             itemBuilder: (context, index) {
        //               return ListTile(
        //                 leading: Image.network(
        //                   articles[index].urlToImage ?? "",
        //                   width: 80,
        //                   height: 80,
        //                   errorBuilder: (context, error, stackTrace) {
        //                     return Container(
        //                       color: Colors.red,
        //                       width: 80,
        //                       height: 80,
        //                     );
        //                   },
        //                 ),
        //                 title: Text(articles[index].title ?? ""),
        //               );
        //             },
        //           );
        //         } else if (snapshot.hasError) {
        //           return Center(child: Text("Error: ${snapshot.error}"));
        //         } else {
        //           return const Center(child: Text("No data"));
        //         }
        //     }
        //   },
        // ),
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
