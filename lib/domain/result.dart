sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class ServerError<T> extends Result<T> {
  ServerErrorException exception;

  ServerError(this.exception);
}

class Error<T> extends Result<T> {
  Exception exception;

  Error(this.exception);
}

class NoData<T> extends Result<T> {}

class ServerErrorException implements Exception {
  String? code;
  String? message;

  ServerErrorException(this.code, this.message);
}
