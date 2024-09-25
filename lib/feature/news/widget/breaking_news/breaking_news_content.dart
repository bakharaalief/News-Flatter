import 'package:flutter/material.dart';
import 'package:news_flutter/core/helper/converter.dart';
import 'package:news_flutter/core/widget/category_chip.dart';
import 'package:news_flutter/domain/news/model/news.dart';

class BreakingNewsContent extends StatelessWidget {
  final News news;

  const BreakingNewsContent({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black54],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //category
          CategoryChip(category: news.category,),

          Spacer(
            flex: 1,
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

          SizedBox(
            height: 5,
          ),

          //title
          Text(
            news.title,
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
