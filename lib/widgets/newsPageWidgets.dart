import 'package:flutter/material.dart';

class NewsWidgets {
  static String errorImage =
      "http://www.gurudevasssb.com/images/News/746851Latest-News.jpg";
  static AppBar newsAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "News Today",
        style: TextStyle(
          fontSize: 25,
          letterSpacing: 2,
          color: Colors.black,
          fontFamily: 'Pacifico-Regular',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Container newsImageWidget(double _height, double _width, imageurl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      height: _height * 0.12,
      width: _width * 0.28,
      child: Image.network(
        imageurl != null ? imageurl : NewsWidgets.errorImage,
        fit: BoxFit.fill,
        alignment: Alignment.center,
      ),
    );
  }

  static Container newsHeadline(double _height, double _width, String title) {
    return Container(
      alignment: Alignment.center,
      height: _height * 0.1,
      width: _width * 0.6,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  static Center newsLoadingwidget() =>
      Center(child: CircularProgressIndicator());
}
