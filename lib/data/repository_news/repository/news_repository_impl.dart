

import 'package:flutter_web/data/model/NewsResponse.dart';

import '../data_source/news_data_source.dart';
import 'news_repository.dart';

class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse> getNews( String? sourceId,) {
    return newsRemoteDataSource.getNews( sourceId);
  }
}