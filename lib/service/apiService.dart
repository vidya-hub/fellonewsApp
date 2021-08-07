import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> getNewsDetails() async {
    http.Response response;
    var queryParameters = {
      'q': "world",
      'apiKey': 'b5392467192c453da66af07f02453acb',
      "from": "2021-08-05",
      "to": "2021-07-01",
      "pageSize": "100"
    };
    // https://newsapi.org/v2/everything?q=india&from=2021-08-05&to=2021-08-05&sortBy=popularity&apiKey=b5392467192c453da66af07f02453acb
    var uri = Uri.https('newsapi.org', '/v2/everything', queryParameters);
    response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    return response;
  }
}
