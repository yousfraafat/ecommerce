sealed class UiState<T> {}

class SuccessState<T> extends UiState<T> {
  T data;

  SuccessState(this.data);
}

class LoadingState<T> extends UiState<T> {}

class ErrorState<T> extends UiState<T> {
  Exception exception;

  ErrorState(this.exception);
}

class NoDataState<T> extends UiState<T> {}
