import 'package:flutter_app1/domain/news/model/news.dart';

abstract class NewsRepository {
  Future<List<News>> getTopHeadlines();
}
