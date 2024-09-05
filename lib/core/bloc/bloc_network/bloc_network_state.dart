abstract class BlocNetworkState<T> {}

class BlocNetworkLoadingState<T> extends BlocNetworkState<T> {}

class BlocNetworkSuccessState<T> extends BlocNetworkState<T> {
  final T result;

  BlocNetworkSuccessState(this.result);
}

class BlocNetworkErrorState<T> extends BlocNetworkState<T> {
  final String error;

  BlocNetworkErrorState(this.error);
}
