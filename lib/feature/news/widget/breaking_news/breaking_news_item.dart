import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/domain/news/model/news.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_content.dart';

class BreakingNewsItem extends StatelessWidget {
  final News news;

  const BreakingNewsItem({super.key, required this.news});

  final double _width = 380;
  final double _height = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Card(
            color: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            child: Stack(
              children: [
                CachedNetworkImage(
                  width: _width,
                  height: _height,
                  imageBuilder: (context, imageProvider) => Container(
                    child: BreakingNewsContent(
                      news: news,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  imageUrl:
                      "https://banggaikep.go.id/portal/wp-content/uploads/2024/03/jokowi-1.jpg",
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.broken_image, size: 60),
                ),
              ],
            )));
  }
}
