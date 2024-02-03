import 'package:flutter/material.dart';
import 'package:news_app/seevice/newsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Const {
  static text(String title, double d, Color color, FontWeight fontWeight) {
    return Text(
      title,
      style: TextStyle(
        fontSize: d,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  static Future<void> launcherUrl(NewsModel newsModel) async {
    final url = newsModel.url;

    if (!await launchUrl(Uri.parse(url!))) {
      throw Exception("Can't open Browser $url");
    }
  }
}
