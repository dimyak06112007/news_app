import 'package:news_app/models/source_model.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      author: json['author'] == null ? '' : json['author'],
      title: json['title'] == null ? '' : json['title'],
      description: json['description'] == null ? '' : json['description'],
      url: json['url'] == null ? '' : json['url'],
      urlToImage: json['urlToImage'] == null
          ? 'https://www.lendacademy.com/wp-content/uploads/2015/05/Marketplace-Lending-News.jpg'
          : json['urlToImage'],
      publishedAt: json['publishedAt'] == null ? '' : json['publishedAt'],
      content: json['content'] == null ? '' : json['content'],
    );
  }
}
