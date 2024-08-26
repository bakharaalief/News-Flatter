import 'package:bloc/bloc.dart';
import 'package:flutter_app1/data/news/news_repository.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_event.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_state.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  BreakingNewsBloc() : super(BreakingNewsLoadingState()) {
    final NewsRepository _newsRepository = NewsRepository();

    // get breaking news
    on<GetBreakingNewsEvent>((event, emit) async {
      try {
        final response = await _newsRepository.getTopHeadlines();
        emit(BreakingNewsSuccessState(response));
      } catch (e) {
        emit(BreakingNewsErrorState(e.toString()));
      }
    });
  }
}
