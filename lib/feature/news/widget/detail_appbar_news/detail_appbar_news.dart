import 'package:flutter/material.dart';
import 'package:news_flutter/core/helper/mapper.dart';
import 'package:news_flutter/domain/news/model/news.dart';

import '../../../../core/helper/converter.dart';
import '../../../../core/widget/category_chip.dart';

class DetailAppbarNews extends StatelessWidget {
  final News news;

  const DetailAppbarNews({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: 60) + EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.transparent,
            Colors.transparent,
            Colors.black
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0, 0.2, 1],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          //category
          CategoryChip(
            category: news.category,
          ),

          SizedBox(
            height: 5,
          ),

          //title
          Text(
            Mapper.TitleTrimmer(news.title),
            textAlign: TextAlign.start,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
          ),

          SizedBox(
            height: 5,
          ),

          //author
          Text(
            "${news.author} - ${Converter.toTimeAgo(news.publishedAt)}",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}
