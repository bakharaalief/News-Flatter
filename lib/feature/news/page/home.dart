import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/core/widget/title_text.dart';
import 'package:news_flutter/core/widget/top_appbar.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_bloc.dart';
import 'package:news_flutter/feature/news/bloc/recommend_news_bloc/recommend_news_bloc.dart';
import 'package:news_flutter/feature/news/widget/breaking_news/breaking_news_content_error.dart';
import 'package:news_flutter/feature/news/widget/breaking_news/breaking_news_content_loading.dart';
import 'package:news_flutter/feature/news/widget/breaking_news/breaking_news_list.dart';
import 'package:news_flutter/feature/news/widget/vertical_news/news_list_loading.dart';

import '../../../core/bloc/bloc_network/bloc_network_event.dart';
import '../../../core/bloc/bloc_network/bloc_network_state.dart';
import '../bloc/recommend_news_bloc/recommend_news_event.dart';
import '../widget/vertical_news/news_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final BreakingNewsBloc _breakingNewsBloc = BreakingNewsBloc();
  final RecommendNewsBloc _recommendNewsBloc = RecommendNewsBloc();

  @override
  void initState() {
    _breakingNewsBloc.add(BlocGetDataEvent());
    _recommendNewsBloc.add(GetRecommendNewsEvent("health"));
    super.initState();
  }

  @override
  void dispose() {
    _breakingNewsBloc.close();
    _recommendNewsBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BreakingNewsBloc>(
          create: (BuildContext context) => _breakingNewsBloc,
        ),
        BlocProvider<RecommendNewsBloc>(
          create: (BuildContext context) => _recommendNewsBloc,
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
            BlocBuilder<BreakingNewsBloc, BlocNetworkState<List<News>>>(
                builder: (context, state) {
              if (state is BlocNetworkErrorState<List<News>>) {
                return BreakingNewsContentError(
                  error: state.error,
                );
              } else if (state is BlocNetworkSuccessState<List<News>>) {
                return BreakingNewsList(listNews: state.result);
              } else {
                return BreakingNewsContentLoading();
              }
            }),

            //recommendation news
            TitleText(
              title: "Recommendation",
              onPressViewAll: () {},
            ),
            BlocBuilder<RecommendNewsBloc, BlocNetworkState<List<News>>>(
                builder: (context, state) {
              if (state is BlocNetworkErrorState<List<News>>) {
                return BreakingNewsContentError(
                  error: state.error,
                );
              } else if (state is BlocNetworkSuccessState<List<News>>) {
                return NewsList(listNews: state.result);
              } else {
                return NewsListLoading();
              }
            }),
          ],
        )),
      ),
    );
  }
}
