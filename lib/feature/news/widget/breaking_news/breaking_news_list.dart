import 'package:flutter/material.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/widget/breaking_news/breaking_news_item.dart';

class BreakingNewsList extends StatelessWidget {
  final List<News> listNews;
  final void Function(News news) onTap;

  const BreakingNewsList(
      {super.key, required this.listNews, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
            itemCount: listNews.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (content, index) {
              return BreakingNewsItem(
                news: listNews[index],
                onTap: onTap,
              );
            }));
  }
}
