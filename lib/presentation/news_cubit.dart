import 'package:bloc/bloc.dart';
import 'package:flutter_web/data/api/api_manager.dart';
import 'package:flutter_web/data/model/NewsResponse.dart';
import 'package:flutter_web/data/repository_news/data_source/news_data_source.dart';
import 'package:flutter_web/data/repository_news/data_source/news_data_source_impl.dart';
import 'package:flutter_web/data/repository_news/repository/news_repository.dart';
import 'package:flutter_web/data/repository_news/repository/news_repository_impl.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  late NewsRepositoryContract newsRepositoryContract;
  late NewsRemoteDataSource newsRemoteDataSource;
  late ApiManager apiManager;
  Source? source;
  NewsCubit() : super(NewsLoading()) {
    apiManager = ApiManager();
    newsRemoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepositoryContract =
        NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSource);
  }

  void getNews(String? sourceId, ) async {
    try {
      var response = await newsRepositoryContract.getNews(sourceId);
      if (response.status == 'error') {
        emit(NewsError(message: response.status));
      } else {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      rethrow;
    }
  }
}
