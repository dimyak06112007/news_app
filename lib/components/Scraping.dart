// lib/hacker_news_scraper.dart
import 'dart:convert';
import 'package:http/http.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:news_app/models/article_model.dart';

var c = '';
// @override
// void initState() {
//   super.initState();
//   initiate()
// }

class Initiate {
  // Make API call to Hackernews homepage
  final Article article;

  Initiate({required this.article});

  Future<List<Map<String, String?>>> initiat() async {
    var client = Client();
    Response response = await client.get(Uri.parse(article.url));
    // Use html parser
    var document = parse(response.body);
    List<Element> textData = document.querySelectorAll('div.entry-content > p');
    List<Map<String, String>> linkMap = [];
    for (var oneText in textData) {
      linkMap.add({'text': oneText.text});
    }
    var linkMapNeeded = linkMap;
    print(linkMapNeeded);
    return linkMapNeeded;
  }
}
