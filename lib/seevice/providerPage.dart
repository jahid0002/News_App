import 'package:flutter/material.dart';
import 'package:news_app/seevice/apiController.dart';
import 'package:news_app/seevice/newsModel.dart';

class ProviderPage extends ChangeNotifier {
  late List<NewsModel> _list = [];
  List<NewsModel> get list => _list;

  void addlist() async {
    try {
      ApiController apiController = ApiController();
      _list = await apiController.getAllData();
    } catch (e) {}

    notifyListeners();
  }
}
