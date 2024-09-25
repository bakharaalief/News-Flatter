import 'package:news_flutter/core/helper/dummy.dart';
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
                Dummy.Image(newsResponse.title?[0] ?? "a"),
                newsResponse.publishedAt ?? "",
                newsResponse.content ?? "",
                Dummy.category(newsResponse.title?[0] ?? "a")))
            .toList() ??
        [];
  }

  static String TitleTrimmer(String title) {
    return title.substring(0, title.indexOf('-')).trim();
  }
}
