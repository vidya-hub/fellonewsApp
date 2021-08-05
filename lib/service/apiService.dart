import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<http.Response> getNewsDetails(String country) async {
    http.Response response;
    var queryParameters = {
      'country': "in",
      'apiKey': 'b5392467192c453da66af07f02453acb',
    };
    var uri = Uri.https('newsapi.org', '/v2/top-headlines', queryParameters);
    response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });
    return response;
  }
}
