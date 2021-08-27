import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/components/Scraping.dart';
import 'package:news_app/models/article_model.dart';

class ArticlePage extends StatefulWidget {
  final Article article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.article.urlToImage),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                FutureBuilder(
                  future: Initiate(article: widget.article).initiat(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var sn = snapshot.data;
                      return createListPView(sn, context);
                    }
                    return LinearProgressIndicator();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createListPView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, int index) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ListTileCheck(data[index]['text'], index)]);
        },
      ),
    );
  }

  Widget ListTileCheck(String data, int index) {
    if (data[0] == '<' || data.substring(0, 6) == 'SOURCE') {
      return Container();
    } else if (data.contains('<iframe')) {
      data = data.substring(0, data.indexOf('<iframe'));
      return ListTile(
        title: Text(
          data,
          style: TextStyle(fontSize: 20),
        ),
      );
    } else {
      return ListTile(
        title: Text(
          data,
          style: TextStyle(fontSize: 20),
        ),
      );
    }
  }
}
