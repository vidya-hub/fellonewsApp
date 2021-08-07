import 'dart:async';
import 'dart:developer';

import 'package:fellonews/models/newsModel.dart';
import 'package:fellonews/service/NewspageMethods.dart';
import 'package:fellonews/service/apiService.dart';
import 'package:fellonews/widgets/newsPageWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var _controller = ScrollController();
  static const int newsPerPage = 20;
  @override
  void initState() {
    super.initState();
  }

  int newsIndex = 0;
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: NewsWidgets.newsAppBar(),
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(),
          height: _height,
          width: _width,
          child: ListView(
            children: [
              FutureBuilder(
                  future: NewspageMethods.getTheNews(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? Container(
                            height: _height * 0.8,
                            child: NotificationListener<ScrollEndNotification>(
                              onNotification: (scrollEnd) {
                                var metrics = scrollEnd.metrics;
                                if (metrics.atEdge) {
                                  if (metrics.pixels != 0) {
                                    if (newsIndex ==
                                        NewspageMethods.chunkNewsList(
                                                    snapshot.data.articles,
                                                    newsPerPage)
                                                .length -
                                            1) {
                                      setState(() {
                                        newsIndex = 0;
                                      });
                                    } else {
                                      setState(() async {
                                        newsIndex += 1;
                                        await NewspageMethods.scrollUp(
                                            _controller);
                                      });
                                    }
                                  }
                                }
                                return true;
                              },
                              child: ListView.builder(
                                controller: _controller,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: NewspageMethods.chunkNewsList(
                                        snapshot.data.articles,
                                        newsPerPage)[newsIndex]
                                    .length,
                                itemBuilder: (context, index) {
                                  String imageurl =
                                      NewspageMethods.chunkNewsList(
                                              snapshot.data.articles,
                                              newsPerPage)[newsIndex][index]
                                          .urlToImage;
                                  String newsTitle =
                                      NewspageMethods.chunkNewsList(
                                              snapshot.data.articles,
                                              newsPerPage)[newsIndex][index]
                                          .title;
                                  return Card(
                                    elevation: 1,
                                    shadowColor: Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          NewsWidgets.newsImageWidget(
                                              _height, _width, imageurl),
                                          NewsWidgets.newsHeadline(
                                              _height, _width, newsTitle),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                        : NewsWidgets.newsLoadingwidget();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
