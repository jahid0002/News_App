import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/seevice/newsModel.dart';

class ApiController {
  List<NewsModel> articles = [];

  final allNewsUrl =
      'https://newsapi.org/v2/everything?q=bitcoin&apiKey=d5ff393c068c45aebfe946d2a04795f9';

  /// breking news url

  final brekingNewsUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=d5ff393c068c45aebfe946d2a04795f9';

  /// hit api method

  Future<List<NewsModel>> getAllData() async {
    try {
      var request = http.Request('GET', Uri.parse(allNewsUrl));
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        var streamData = await response.stream.bytesToString();

       Map<String, dynamic> data = jsonDecode(streamData);
        List<dynamic> body = data['articles'];
        body.forEach((element) {
          articles.add(NewsModel.fromJson(element));
        });
      }
      return articles;
    } catch (e) {
      rethrow;
    }
  }

  // breking news
  Future<List<NewsModel>> getHeadLineData() async {
    try {
      Response response = await get(Uri.parse(brekingNewsUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<NewsModel> articles =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articles;
      } else {
        throw Exception('News not found');
      }
    } catch (e) {
      rethrow;
    }
  }
}
