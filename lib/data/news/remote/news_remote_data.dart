import 'package:dio/dio.dart';
import 'package:flutter_app1/core/helper/constant.dart';
import 'package:flutter_app1/data/news/remote/response/top_headlines_response.dart';

class NewsRemoteData {
  final _dio = Dio();

  Future<TopHeadlinesResponse> getTopHeadlines() async {
    try {
      final response = await _dio.get(
          "${Constant.baseUrl}/top-headlines?sources=bbc-news&apiKey=${Constant.apiKey}");
      if (response.statusCode == 200) {
        return TopHeadlinesResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
