import 'dart:convert';

import 'package:api_pluter/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Detail extends StatefulWidget {
  final Article article;

  const Detail({super.key, required this.article});

  @override
  State<Detail> createState() => Details(article: article);
}

class Details extends State<Detail> {
  final Article article;

  Details({required this.article});

  @override
  Widget build(BuildContext context) {
    int? page = 0;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        body: Column(
          children: [
            Container(
                width: 400,
                height: 200,
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.network(
                      article.urlToImage ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 400,
                          height: 200,
                        );
                      },
                    ),
                  ),
                )),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 3, left: 10),
              child: Text(article.author ?? 'Ẩn danh',
                  style: const TextStyle(
                      fontFamily: AutofillHints.addressCity,
                      fontWeight: FontWeight.w200,
                      fontSize: 13),
                  textAlign: TextAlign.right),
            ),
            Center(
                child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(article.title ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
            )),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 3, right: 10),
              child: Text(article.publishedAt?.substring(0, 10) ?? 'Ẩn danh',
                  style: const TextStyle(
                      fontFamily: AutofillHints.addressCity,
                      fontWeight: FontWeight.w200,
                      fontSize: 13),
                  textAlign: TextAlign.right),
            ),
            Center(
                child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(article.description ?? '',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            )),
            Center(
                child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(article.content ?? '',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            )),
          ],
        ));
  }
}
