import 'package:flutter_app1/core/di/service_locator.dart';
import 'package:flutter_app1/core/helper/mapper.dart';
import 'package:flutter_app1/data/news/remote/news_remote_data.dart';
import 'package:flutter_app1/domain/news/model/news.dart';
import 'package:flutter_app1/domain/news/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  final NewsRemoteData _newsRemoteData = serviceLocator<NewsRemoteData>();

  @override
  Future<List<News>> getTopHeadlines() async {
    final response = await _newsRemoteData.getTopHeadlines();
    return Mapper.articleResponseToListNews(response.articles);
  }
}
