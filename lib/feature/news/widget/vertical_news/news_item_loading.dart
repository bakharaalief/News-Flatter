import 'package:flutter/material.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:shimmer/shimmer.dart';

class NewsItemLoading extends StatelessWidget {
  final News news;

  const NewsItemLoading({super.key, required this.news});

  final double _height = 150;
  final double _width = 150;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueAccent,
      highlightColor: Colors.white,
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: 15) + EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            //image
            Container(
              width: _width,
              height: _height,
              color: Colors.yellow,
            ),

            SizedBox(
              width: 12,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //category
                  Container(
                    width: double.infinity,
                    height: 10,
                    color: Colors.yellow,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //title
                  Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.yellow,
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  //author info
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        color: Colors.yellow,
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      //author
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 10,
                          color: Colors.yellow,
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),

                  Container(
                    width: double.infinity,
                    height: 20,
                    color: Colors.yellow,
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
