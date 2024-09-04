import 'package:bloc/bloc.dart';
import 'package:flutter_app1/core/di/service_locator.dart';
import 'package:flutter_app1/domain/news/usecase/news_use_case.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_event.dart';
import 'package:flutter_app1/feature/news/bloc/breaking_news/breaking_news_state.dart';

class BreakingNewsBloc extends Bloc<BreakingNewsEvent, BreakingNewsState> {
  BreakingNewsBloc() : super(BreakingNewsLoadingState()) {
    final NewsUseCase _newsUseCase = serviceLocator<NewsUseCase>();

    // get breaking news
    on<GetBreakingNewsEvent>((event, emit) async {
      try {
        final response = await _newsUseCase.getTopHeadlines();
        emit(BreakingNewsSuccessState(response));
      } catch (e) {
        emit(BreakingNewsErrorState(e.toString()));
      }
    });
  }
}
