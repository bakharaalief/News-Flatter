import 'package:flutter/material.dart';
import 'package:flutter_app1/core/widget/news/news_list.dart';
import 'package:flutter_app1/core/widget/title_text.dart';
import 'package:flutter_app1/core/widget/top_appbar.dart';
import 'package:flutter_app1/domain/news/news.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<News> _listNews = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      _listNews.add(new News(
          "The New York Times",
          "Full Transcript of Kamala Harris’s Speech at the Democratic Convention - The New York Times",
          "",
          "",
          "",
          "2024-08-23T04:55:30Z",
          ""));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppbar(
          firstIcon: Icons.menu,
          firstIconTap: () {},
          secondIcon: Icons.search,
          secondIconTap: () {},
          thirdIcon: Icons.notifications_rounded,
          thirdIconTap: () {},
          iconColor: Colors.white,
          bgColor: Colors.blueAccent),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TitleText(
            title: "Breaking News",
            onPressViewAll: () {},
          ),
          BreakingNewsList(listNews: _listNews),
          TitleText(
            title: "Recommendation",
            onPressViewAll: () {},
          ),
          NewsList(
            listNews: _listNews,
          )
        ],
      )),
    );
  }
}
