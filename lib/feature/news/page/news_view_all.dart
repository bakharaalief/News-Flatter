import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_paging_bloc/breaking_news_paging_bloc.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_paging_bloc/breaking_news_paging_event.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_paging_bloc/breaking_news_paging_state.dart';
import 'package:news_flutter/feature/news/page/news_detail.dart';
import 'package:news_flutter/feature/news/widget/vertical_news/news_item.dart';

import '../../../core/widget/top_appbar.dart';

class NewsViewAll extends StatefulWidget {
  const NewsViewAll({super.key});

  @override
  State<NewsViewAll> createState() => _NewsViewAllState();
}

class _NewsViewAllState extends State<NewsViewAll> {
  final PagingController<int, News> _pagingController =
      PagingController(firstPageKey: 0);
  final BreakingNewsPagingBloc _breakingNewsPagingBloc =
      BreakingNewsPagingBloc();

  @override
  void initState() {
    super.initState();
    _breakingNewsPagingBloc.add(GetBreakingNewsPagingEvent(_pagingController));
  }

  @override
  void dispose() {
    _breakingNewsPagingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void _arrowBack() {
      Navigator.pop(context);
    }

    void _onTapNews(News news) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewsDetail(
                    news: news,
                  )));
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<BreakingNewsPagingBloc>(
          create: (BuildContext context) => _breakingNewsPagingBloc,
        ),
      ],
      child: Scaffold(
        appBar: TopAppbar(
            firstIcon: Icons.arrow_back,
            firstIconTap: _arrowBack,
            secondIcon: Icons.search,
            secondIconTap: () {},
            thirdIcon: Icons.notifications_rounded,
            thirdIconTap: () {},
            iconColor: Colors.white,
            bgColor: Colors.blueAccent),
        body: BlocBuilder<BreakingNewsPagingBloc,
                BreakingNewsPagingState<PagingController<int, News>>>(
            builder: (context, state) {
          if (state
              is BreakingNewsPagingSuccessState<PagingController<int, News>>) {
            return PagedListView(
                pagingController: state.result,
                builderDelegate: PagedChildBuilderDelegate<News>(
                  itemBuilder: (context, item, index) => NewsItem(
                    onTap: _onTapNews,
                    news: item,
                  ),
                ));
          } else {
            return Text("Loading Bro");
          }
        }),
      ),
    );
  }
}
