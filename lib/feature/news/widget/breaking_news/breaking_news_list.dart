import 'package:flutter/material.dart';
import 'package:flutter_app1/domain/news/model/news.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_item.dart';

class BreakingNewsList extends StatelessWidget {
  final List<News> listNews;

  const BreakingNewsList({super.key, required this.listNews});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: listNews.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (content, index) {
              return BreakingNewsItem(news: listNews[index]);
            }));
  }
}
