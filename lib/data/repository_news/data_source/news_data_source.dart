import 'package:flutter_web/data/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNews( String? sourceId,);
}

abstract class NewsLocalDataSource {}