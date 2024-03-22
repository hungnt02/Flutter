import 'dart:convert';

import 'package:api_pluter/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Detail extends StatelessWidget {
  final Article article;

  const Detail({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        body: const Column(
          children: [
            Card(
              child: Image(
                image: NetworkImage(
                    'https://c.biztoc.com/p/0d1167555ca0b473/s.webp'),
                width: 400,
                height: 150,
                alignment: Alignment.topCenter,
              ),
            ),
            Center(
              child: Text(
                  "Elizabeth Warren unloads on Elon Musk, urging SEC chief Gary Gensler to probe pathway for ‘Tesla to channel money to X’",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
            Center(
              child: Text(
                  "Sen. Elizabeth Warren is again calling on the Securities and Exchange Commission to investigate whether Elon Musk’s dealings with Tesla board members have crossed the line from a CEO who answers to independent board members with the power to hire and fire the…",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
            )
          ],
        ));
  }

  // Future<Article> getArticles() async {
  //   const url =
  //       "https://newsapi.org/v2/top-headlines?country=us&apiKey=3c1a3d55326a4307a86978b745894d5d";
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final Article articles;
  //     final body = jsonDecode(response.body) as Map<String, dynamic>;
  //     // final articlesData = body['articles'] as List<dynamic>;
  //     // articlesData.forEach((articleData) {
  //     //   articles.add(Article.fromMap(articleData));
  //     // });
  //     // return articles;
  //   } else {
  //     throw Exception('Failed to load articles');
  //   }
  // }
}
