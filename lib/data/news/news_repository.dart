import 'package:flutter_app1/core/helper/mapper.dart';
import 'package:flutter_app1/data/news/remote/remote_data.dart';
import 'package:flutter_app1/domain/news/model/news.dart';

class NewsRepository {
  final RemoteData _remoteData = RemoteData();

  Future<List<News>> getTopHeadlines() async {
    final response = await _remoteData.getTopHeadlines();
    return Mapper.articleResponseToListNews(response.articles);
  }
}
