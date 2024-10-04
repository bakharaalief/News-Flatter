import 'package:news_flutter/domain/news/model/news.dart';

abstract class NewsUseCase {
  Future<List<News>> getTopHeadlines();

  Future<List<News>> getTopHeadlinesPaging(int page);

  Future<List<News>> getTopHeadlinesCategory(String category);
}
