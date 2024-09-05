import 'package:flutter/material.dart';
import 'package:news_flutter/domain/news/model/news.dart';

import 'news_item.dart';

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
