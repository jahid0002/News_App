import 'package:flutter/material.dart';
import 'package:news_app/pages/componnent.dart';
import 'package:news_app/seevice/apiController.dart';
import 'package:news_app/seevice/newsModel.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({super.key});

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: apiController.getHeadLineData(),
            builder: (
              context,
              snapshot,
            ) {
              if (snapshot.hasData) {
                List<NewsModel> articaList = snapshot.data?? [];
                return ListView.builder(
                  itemCount: articaList.length,
                  itemBuilder: ((context, index) {
                  return ItemComponent(newsModel: articaList[index]);
                }));
              }
              return Center(child: CircularProgressIndicator(color: Colors.blue.shade400));
            }));
  }
}
