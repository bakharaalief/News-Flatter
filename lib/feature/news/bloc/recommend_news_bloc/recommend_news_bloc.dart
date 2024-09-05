import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_flutter/core/bloc/bloc_network/bloc_network_state.dart';
import 'package:news_flutter/domain/news/model/news.dart';
import 'package:news_flutter/feature/news/bloc/recommend_news_bloc/recommend_news_event.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../domain/news/usecase/news_use_case.dart';

class RecommendNewsBloc
    extends Bloc<RecommendNewsEvent, BlocNetworkState<List<News>>> {
  RecommendNewsBloc() : super(BlocNetworkLoadingState<List<News>>()) {
    final NewsUseCase _newsUseCase = serviceLocator<NewsUseCase>();

    // get breaking news
    on<GetRecommendNewsEvent>((event, emit) async {
      try {
        final response =
            await _newsUseCase.getTopHeadlinesCategory(event.category);
        emit(BlocNetworkSuccessState<List<News>>(response));
      } catch (e) {
        emit(BlocNetworkErrorState<List<News>>(e.toString()));
      }
    });
  }
}
