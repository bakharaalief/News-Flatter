import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_flutter/core/di/service_locator.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/domain/news/usecase/news_use_case.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_paging_bloc/breaking_news_paging_event.dart';
import 'package:news_flutter/feature/news/bloc/breaking_news_paging_bloc/breaking_news_paging_state.dart';

class BreakingNewsPagingBloc extends Bloc<BreakingNewsPagingEvent,
    BreakingNewsPagingState<PagingController<int, News>>> {
  BreakingNewsPagingBloc() : super(BreakingNewsPagingLoadingState()) {
    final NewsUseCase _newsUseCase = serviceLocator<NewsUseCase>();

    // get breaking news
    on<GetBreakingNewsPagingEvent>((event, emit) async {
      event.pagingController.addPageRequestListener((pageKey) async {
        try {
          final List<News> newItems =
              await _newsUseCase.getTopHeadlinesPaging(pageKey);
          final bool isLastPage = newItems.isEmpty;
          if (isLastPage) {
            event.pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = pageKey + 1;
            event.pagingController.appendPage(newItems, nextPageKey);
          }
        } catch (error) {
          event.pagingController.error = error;
        }
      });

      emit(BreakingNewsPagingSuccessState<PagingController<int, News>>(
          event.pagingController));
    });
  }
}
