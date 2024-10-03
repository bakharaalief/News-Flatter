import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_flutter/domain/news/model/news.dart';

abstract class BreakingNewsPagingEvent {}

class GetBreakingNewsPagingEvent extends BreakingNewsPagingEvent {
  final PagingController<int, News> pagingController;

  GetBreakingNewsPagingEvent(this.pagingController);
}
