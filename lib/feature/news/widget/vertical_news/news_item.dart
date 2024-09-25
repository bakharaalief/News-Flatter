import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/core/helper/converter.dart';
import 'package:news_flutter/domain/news/model/news.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final void Function(News news) onTap;

  const NewsItem({super.key, required this.news, required this.onTap});

  final double _height = 150;
  final double _width = 150;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(news),
      child: Container(
        color: Colors.white,
        margin:
            EdgeInsets.symmetric(horizontal: 15) + EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            //image
            CachedNetworkImage(
              width: _width,
              height: _height,
              imageBuilder: (context, imageProvider) => Container(
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

            SizedBox(
              width: 12,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //category
                  Text(
                    news.category,
                    style: TextStyle(fontSize: 14),
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //author info
                  Row(
                    children: [
                      CachedNetworkImage(
                        width: 30,
                        height: 30,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
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

                      SizedBox(
                        width: 10,
                      ),

                      //author
                      Expanded(
                        child: Text(
                          "${news.author}",
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 14),
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Text(
                    Converter.toTimeAgo(news.publishedAt),
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
