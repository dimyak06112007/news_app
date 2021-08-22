import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) => customListTile(
                articles[index], context
              ),
            );
          }
          print('in else. So snapshot is $snapshot');
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
