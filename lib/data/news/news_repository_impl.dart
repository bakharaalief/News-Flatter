import 'package:news_flutter/core/di/service_locator.dart';
import 'package:news_flutter/core/helper/mapper.dart';
import 'package:news_flutter/data/news/remote/news_remote_data.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/domain/news/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteData _newsRemoteData = serviceLocator<NewsRemoteData>();

  @override
  Future<List<News>> getTopHeadlines() async {
    final response = await _newsRemoteData.getTopHeadlines();
    return Mapper.articleResponseToListNews(response.articles);
  }

  @override
  Future<List<News>> getTopHeadlinesCategory(String category) async {
    final response = await _newsRemoteData.getTopHeadlinesCategory(category);
    return Mapper.articleResponseToListNews(response.articles);
  }
}
