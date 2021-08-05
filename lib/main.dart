import 'dart:developer';

import 'package:fellonews/models/newsModel.dart';
import 'package:fellonews/screens/homescreen.dart';
import 'package:fellonews/service/apiService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}










          // http.Response response = await ApiService.getNewsDetails("in");
          // News news = newsFromJson(response.body);