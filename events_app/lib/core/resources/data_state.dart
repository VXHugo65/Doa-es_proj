import 'package:events_app/core/resources/remote_error.dart';

class DataState<T> {
  final T? data;
  final RemoteError? error;

  DataState({this.data, this.error});
}

final class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

final class DataFailure<T> extends DataState<T> {
  DataFailure(RemoteError error) : super(error: error);
}
