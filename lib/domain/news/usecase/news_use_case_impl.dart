import 'package:news_flutter/core/di/service_locator.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/domain/news/repository/news_repository.dart';
import 'package:news_flutter/domain/news/usecase/news_use_case.dart';

class NewsUseCaseImpl extends NewsUseCase {
  final NewsRepository _newsRepository = serviceLocator<NewsRepository>();

  @override
  Future<List<News>> getTopHeadlines() {
    return _newsRepository.getTopHeadlines();
  }

  @override
  Future<List<News>> getTopHeadlinesCategory(String category) async {
    return _newsRepository.getTopHeadlinesCategory(category);
  }
}
