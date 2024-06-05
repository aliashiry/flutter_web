import 'package:flutter_web/data/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNews( String? sourceId,);
}