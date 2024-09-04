import 'package:flutter_app1/domain/news/model/news.dart';

abstract class BreakingNewsState {
  const BreakingNewsState();
}

class BreakingNewsLoadingState extends BreakingNewsState {}

class BreakingNewsSuccessState extends BreakingNewsState {
  final List<News> breakingNews;

  const BreakingNewsSuccessState(this.breakingNews);
}

class BreakingNewsErrorState extends BreakingNewsState {
  final String error;

  const BreakingNewsErrorState(this.error);
}
