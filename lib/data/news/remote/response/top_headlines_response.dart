
import 'package:flutter_app1/data/news/remote/response/article_response.dart';

class TopHeadlinesResponse {
  String? status;
  int? totalResults;
  List<ArticleResponse>? articles;

  TopHeadlinesResponse({this.status, this.totalResults, this.articles});

  TopHeadlinesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticleResponse>[];
      json['articles'].forEach((v) {
        articles!.add(new ArticleResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}