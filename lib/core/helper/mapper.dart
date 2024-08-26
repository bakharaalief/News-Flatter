import 'package:flutter_app1/data/news/remote/response/article_response.dart';
import 'package:flutter_app1/domain/news/model/news.dart';

class Mapper {
  static List<News> articleResponseToListNews(List<ArticleResponse>? data) {
    return data
            ?.map((newsResponse) => News(
                newsResponse.author ?? "",
                newsResponse.title ?? "",
                newsResponse.description ?? "",
                newsResponse.url ?? "",
                newsResponse.urlToImage ?? "",
                newsResponse.publishedAt ?? "",
                newsResponse.content ?? ""))
            .toList() ??
        [];
  }
}
