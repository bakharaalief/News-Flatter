import 'package:flutter/material.dart';
import 'package:flutter_app1/core/widget/news/news_list.dart';
import 'package:flutter_app1/core/widget/title_text.dart';
import 'package:flutter_app1/core/widget/top_appbar.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_bloc.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_event.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_state.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_content_error.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_content_loading.dart';
import 'package:flutter_app1/feature/news/widget/breaking_news/breaking_news_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final BreakingNewsBloc _breakingNewsBloc = BreakingNewsBloc();

  @override
  void initState() {
    _breakingNewsBloc.add(GetBreakingNewsEvent());
    super.initState();
  }

  @override
  void dispose() {
    _breakingNewsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreakingNewsBloc>(
          create: (BuildContext context) => _breakingNewsBloc,
        )
      ],
      child: Scaffold(
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
            //breaking news
            TitleText(
              title: "Breaking News",
              onPressViewAll: () {},
            ),
            BlocBuilder<BreakingNewsBloc, BreakingNewsState>(
                builder: (context, state) {
              if (state is BreakingNewsErrorState) {
                return BreakingNewsContentError(
                  error: state.error,
                );
              } else if (state is BreakingNewsSuccessState) {
                return BreakingNewsList(listNews: state.breakingNews);
              } else {
                return BreakingNewsContentLoading();
              }
            }),

            //recommendation news
            TitleText(
              title: "Recommendation",
              onPressViewAll: () {},
            ),
            NewsList(
              listNews: [],
            )
          ],
        )),
      ),
    );
  }
}
