import 'package:dio/dio.dart';
import 'package:news_flutter/core/helper/constant.dart';
import 'package:news_flutter/data/news/remote/response/top_headlines_response.dart';

class NewsRemoteData {
  final _dio = Dio();

  Future<TopHeadlinesResponse> getTopHeadlines() async {
    try {
      final response = await _dio.get(
          "${Constant.baseUrl}/top-headlines?pageSize=5&apiKey=${Constant.apiKey}&country=us");
      if (response.statusCode == 200) {
        return TopHeadlinesResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  Future<TopHeadlinesResponse> getTopHeadlinesPaging(int page) async {
    try {
      final response = await _dio.get(
          "${Constant.baseUrl}/top-headlines?pageSize=5&apiKey=${Constant.apiKey}&country=us&page=${page}");
      if (response.statusCode == 200) {
        return TopHeadlinesResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }

  Future<TopHeadlinesResponse> getTopHeadlinesCategory(String category) async {
    try {
      final response = await _dio.get(
          "${Constant.baseUrl}/top-headlines?pageSize=5&apiKey=${Constant.apiKey}&country=us&category=${category}");
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
