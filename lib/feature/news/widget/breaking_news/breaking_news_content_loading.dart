import 'package:flutter/material.dart';
import 'package:flutter_app1/core/helper/dummy.dart';
import 'package:flutter_app1/domain/news/model/news.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_list.dart';
import 'package:shimmer/shimmer.dart';

class BreakingNewsContentLoading extends StatelessWidget {
  final List<News> _listNews = Dummy.createNewsDummy(3);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.blueAccent,
        highlightColor: Colors.white,
        child: BreakingNewsList(listNews: _listNews));
  }
}