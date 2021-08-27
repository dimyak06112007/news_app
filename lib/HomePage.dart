import 'package:flutter/material.dart';
import 'package:news_app/components/customListTile.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/api_service.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'dart:math' as math;

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
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          print('in else. So snapshot is $snapshot');
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.amber.shade400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                  child: Text(
                    'TECH NEWS',
                    style: TextStyle(
                      color: Colors.blueAccent.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
                Center(
                  child: CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 72,
                    selectedColor: Colors.yellow,
                    unselectedColor: Colors.lightBlue,
                    width: 300,
                    height: 300,
                    child: Icon(
                      Icons.tag_faces,
                      color: Colors.red,
                      size: 84,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
