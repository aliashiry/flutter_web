import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_web/data/api/api_constant.dart';
import 'package:flutter_web/data/model/NewsResponse.dart';

class ApiManager {
 static Future<NewsResponse> getNews(String? sourceId) async {
    Uri url =
    Uri.https(ApiConstants.baseUrlServer, ApiConstants.NewsApiServer, {
      'apiKey': '2834e41a6cd94fb484f8df821c7606fd',
      'q': 'sports',
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      print(json);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}