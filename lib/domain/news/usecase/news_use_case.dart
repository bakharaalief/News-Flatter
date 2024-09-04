import 'package:flutter_app1/domain/news/model/news.dart';

abstract class NewsUseCase {
  Future<List<News>> getTopHeadlines();
}
