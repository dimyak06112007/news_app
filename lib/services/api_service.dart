import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?pageSize=100&domains=nextbigfuture.com&apiKey=ad09a71da5bd4fd0a2441d7d47b7dda7";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      print(articles);
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
