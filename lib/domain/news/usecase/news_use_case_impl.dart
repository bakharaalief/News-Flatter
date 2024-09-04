import 'package:flutter_app1/core/di/service_locator.dart';
import 'package:flutter_app1/domain/news/model/news.dart';
import 'package:flutter_app1/domain/news/repository/news_repository.dart';
import 'package:flutter_app1/domain/news/usecase/news_use_case.dart';

class NewsUseCaseImpl extends NewsUseCase {
  final NewsRepository _newsRepository = serviceLocator<NewsRepository>();

  @override
  Future<List<News>> getTopHeadlines() {
    return _newsRepository.getTopHeadlines();
  }
}
