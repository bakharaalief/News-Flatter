import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/widget/breaking_news/breaking_news_content.dart';

class BreakingNewsItem extends StatelessWidget {
  final News news;
  final void Function(News news) onTap;

  const BreakingNewsItem({super.key, required this.news, required this.onTap});

  final double _width = 380;
  final double _height = 300;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(news),
      child: Container(
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
                    imageUrl: news.urlToImage,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.broken_image, size: 60),
                  ),
                ],
              ))),
    );
  }
}
