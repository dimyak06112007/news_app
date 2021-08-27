import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticlePage(article: article),
        ),
      );
    },
    child: Container(
      //todo if I will implement news in other apps, I have to add PageStorageKey() to save location when moving between screens.
      // key: PageStorageKey(),
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: Image.network(
              article.urlToImage,
              key: UniqueKey(),
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: Container(
                    width: double.infinity,
                    height: 200,
                    child: CircularProgressIndicator(
                      color: Colors.lightBlueAccent,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            article.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    ),
  );
}
