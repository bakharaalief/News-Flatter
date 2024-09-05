import 'package:flutter/material.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/widget/vertical_news/news_item_loading.dart';

import '../../../../core/helper/dummy.dart';

class NewsListLoading extends StatelessWidget {
  final List<News> _listNews = Dummy.createNewsDummy(10);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: _listNews.length,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (content, index) {
              return NewsItemLoading(news: _listNews[index]);
            }));
  }
}
