abstract class BreakingNewsPagingState<T> {}

class BreakingNewsPagingLoadingState<T> extends BreakingNewsPagingState<T> {}

class BreakingNewsPagingSuccessState<T> extends BreakingNewsPagingState<T> {
  final T result;

  BreakingNewsPagingSuccessState(this.result);
}
