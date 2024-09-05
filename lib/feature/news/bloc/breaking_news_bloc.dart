import 'package:news_flutter/domain/news/model/news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bloc/bloc_network/bloc_network_event.dart';
import '../../../core/bloc/bloc_network/bloc_network_state.dart';
import '../../../core/di/service_locator.dart';
import '../../../domain/news/usecase/news_use_case.dart';

class BreakingNewsBloc
    extends Bloc<BlocNetworkEvent, BlocNetworkState<List<News>>> {
  BreakingNewsBloc() : super(BlocNetworkLoadingState<List<News>>()) {
    final NewsUseCase _newsUseCase = serviceLocator<NewsUseCase>();

    // get breaking news
    on<BlocGetDataEvent>((event, emit) async {
      try {
        final response = await _newsUseCase.getTopHeadlines();
        emit(BlocNetworkSuccessState<List<News>>(response));
      } catch (e) {
        emit(BlocNetworkErrorState<List<News>>(e.toString()));
      }
    });
  }
}
