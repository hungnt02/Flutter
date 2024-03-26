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
        body: Column(
          children: [
            Card(
              child: Image(
                fit: BoxFit.contain,
                image: NetworkImage(article.urlToImage ?? ''),
                width: 400,
                height: 150,
                alignment: Alignment.topCenter,
              ),
            ),
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
                child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Text(article.content ?? '',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
            ))
          ],
        ));
  }
}
