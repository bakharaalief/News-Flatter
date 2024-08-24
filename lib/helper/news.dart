import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter_app1/model/news_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> listNews = [];

  // Future<Void> fetchNews(String category) async {
  //
  //   final response = await http.get(
  //       "https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=e5fac7dc0b984f9bb8fd852647ce212b"
  //   );
  //
  //   var jsonData = jsonDecode(response.body);
  //
  //   // If the server did return a 200 OK response,
  //   if (jsonData["status"] == "ok") {
  //     jsonData["articles"].forEach((element){
  //
  //       if(element["urlToImage"] != null && element["description"] != null){
  //
  //         NewsModel news = new NewsModel();
  //
  //         news.author = element["author"];
  //         news.title = element["title"];
  //         news.description = element["description"];
  //         news.url = element["url"];
  //         news.urlToImage = element["urlToImage"];
  //         news.publishedAt = element["publishedAt"];
  //         news.content = element["content"];
  //
  //         listNews.add(news);
  //       }
  //
  //     });
  //   }
  //
  //   // If the server did not return a 200 OK response,
  //   else {
  //     throw Exception('Failed to load News');
  //   }
  //
  // }

  Future<List<NewsModel>> fetchNews(String category) async {
    try {
      final url =
          "https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=e5fac7dc0b984f9bb8fd852647ce212b";
      final response = await http.get(Uri.parse(url));
      print(response);
      return [];
    } catch (e) {
      throw Exception('Failed to load User Data: $e');
    }
  }
}
