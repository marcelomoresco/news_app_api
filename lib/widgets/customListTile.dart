import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/article_model.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () async {
      await launchUrl(Uri.parse(article.url));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            article.description,
            style: TextStyle(
              fontSize: 12.0,
            ),
          )
        ],
      ),
    ),
  );
}
