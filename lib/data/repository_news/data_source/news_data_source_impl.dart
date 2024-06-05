import 'package:flutter_web/data/api/api_manager.dart';
import 'package:flutter_web/data/model/NewsResponse.dart';

import 'news_data_source.dart';


class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNews(String? sourceId,) async {
    var response = await ApiManager.getNews(sourceId,);
    return response;
  }
}