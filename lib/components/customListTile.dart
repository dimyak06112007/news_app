import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/pages/articles_details_page.dart';

// import 'dart:html' as html;
//
// @override
// final String src = '';
// final html.IFrameElement _iframeElement = html.IFrameElement();
//
// void _setup(String src, num width, num height){
//   final src = src;
//   ui.platformViewRegistry.registerViewFactory('iframe-$src', (int viewId){
//     final element =_iframeElement
//     ..style.border = '0'
//     ..allowFullscreen = widget.wedAllowFullScreen
//     ..height = height.toInt().toString()
//     ..width = width.toInt().toString();
//     if (src !=null){
//       String _src = src;
//       if()
//     }
//   })
// }
Widget Img(article) => Image.network(
      article.urlToImage,
      key: UniqueKey(),
      fit: BoxFit.cover,
      width: double.infinity,
      height: 200,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
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
        }
      },
    );

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
            child: Img(article),
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
