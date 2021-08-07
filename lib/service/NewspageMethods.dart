import 'package:fellonews/models/newsModel.dart';
import 'package:fellonews/service/apiService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewspageMethods {
  static Future<News> getTheNews() async {
    http.Response response = await ApiService.getNewsDetails();
    News news = newsFromJson(response.body);
    return news;
  }

  static List chunkNewsList(List<Article> newsList, int chunkSize) {
    List newsChunks = [];
    int len = newsList.length;
    for (var i = 0; i < len; i += chunkSize) {
      int size = i + chunkSize;
      newsChunks.add(newsList.sublist(i, size > len ? len : size));
    }
    return newsChunks;
  }

  static Future<void> scrollUp(ScrollController _controller) async {
    final double start = 0;
    await _controller.animateTo(
      start,
      duration: Duration(
        seconds: 1,
      ),
      curve: Curves.bounceIn,
    );
  }
}
