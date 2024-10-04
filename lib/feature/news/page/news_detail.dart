import 'package:flutter/material.dart';
import 'package:news_flutter/core/helper/dummy.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/widget/detail_appbar/detail_appbar.dart';

class NewsDetail extends StatefulWidget {
  final News news;

  const NewsDetail({super.key, required this.news});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  IconData _bookmarkIcon = Icons.bookmark_border;
  bool _isBookmarked = false;

  void _arrowBack() {
    Navigator.pop(context);
  }

  void _clickBookmark() {
    setState(() {
      if (!_isBookmarked) {
        _isBookmarked = true;
        _bookmarkIcon = Icons.bookmark;
        _showBookmarked("Success", "Berita berhasil disimpan");
      } else {
        _isBookmarked = false;
        _bookmarkIcon = Icons.bookmark_border;
        _showBookmarked("Success", "Berita berhasil diremove");
      }
    });
  }

  void _showBookmarked(String title, String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        DetailAppBar(
          firstIcon: Icons.arrow_back,
          firstIconTap: _arrowBack,
          secondIcon: _bookmarkIcon,
          secondIconTap: _clickBookmark,
          thirdIcon: Icons.menu,
          thirdIconTap: () {},
          iconColor: Colors.white,
          bgColor: Colors.blueAccent,
          news: widget.news,
        ),
        SliverToBoxAdapter(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    Dummy.createLorem(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
        )
      ],
    ));
  }
}
