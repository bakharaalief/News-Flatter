import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/domain/news/model/news.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  final double _height = 150;
  final double _width = 150;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            imageUrl:
                "https://banggaikep.go.id/portal/wp-content/uploads/2024/03/jokowi-1.jpg",
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
                  "Sports",
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
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                  news.publishedAt,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
