import 'package:news_flutter/data/news/remote/response/article_response.dart';
import 'package:news_flutter/domain/news/model/news.dart';

class Mapper {
  static List<News> articleResponseToListNews(List<ArticleResponse>? data) {
    return data
            ?.map((newsResponse) => News(
                newsResponse.author ?? "No Author",
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
