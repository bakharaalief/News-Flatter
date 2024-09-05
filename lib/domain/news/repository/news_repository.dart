import 'package:news_flutter/domain/news/model/news.dart';

abstract class NewsRepository {
  Future<List<News>> getTopHeadlines();

  Future<List<News>> getTopHeadlinesCategory(String category);
}
