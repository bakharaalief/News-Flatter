import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/core/widget/circular_btn.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/widget/detail_appbar_news/detail_appbar_news.dart';

class DetailAppBar extends StatelessWidget {
  final IconData firstIcon;
  final VoidCallback firstIconTap;
  final IconData secondIcon;
  final VoidCallback secondIconTap;
  final IconData thirdIcon;
  final VoidCallback thirdIconTap;
  final Color iconColor;
  final Color bgColor;
  final News news;

  const DetailAppBar(
      {super.key,
      required this.firstIcon,
      required this.firstIconTap,
      required this.secondIcon,
      required this.secondIconTap,
      required this.thirdIcon,
      required this.thirdIconTap,
      required this.iconColor,
      required this.bgColor,
      required this.news});

  final double _toolbarHeight = 75;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      collapsedHeight: 400,
      expandedHeight: 500,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      toolbarHeight: _toolbarHeight,
      title: Container(
        child: Row(
          children: [
            //first icon
            CircularBtn(
              iconName: firstIcon,
              size: 30,
              color: iconColor,
              bgColor: bgColor,
              onTap: firstIconTap,
            ),

            Spacer(
              flex: 1,
            ),

            //second icon
            CircularBtn(
                iconName: secondIcon,
                size: 30,
                color: iconColor,
                bgColor: bgColor,
                onTap: secondIconTap),

            SizedBox(
              width: 10,
            ),

            //third icon
            CircularBtn(
                iconName: thirdIcon,
                size: 30,
                color: iconColor,
                bgColor: bgColor,
                onTap: thirdIconTap)
          ],
        ),
      ),
      backgroundColor: Colors.white,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
              child: CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                        child: DetailAppbarNews(
                          news: news,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.broken_image, size: 60),
                  imageUrl: news.urlToImage)),
        ],
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
            height: 32,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
          )),
    );
  }
}
