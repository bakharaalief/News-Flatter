import 'package:flutter/material.dart';
import 'package:flutter_app1/core/widget/news/news_item.dart';
import 'package:flutter_app1/domain/news/model/news.dart';

class NewsList extends StatelessWidget {
  final List<News> listNews;

  const NewsList({super.key, required this.listNews});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: listNews.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (content, index) {
              return NewsItem(news: listNews[index]);
            }));
  }
}
