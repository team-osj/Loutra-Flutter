enum NoticeStateEnum { empty, loading, error, loaded }

sealed class NoticeState<T> {
  NoticeState({required this.noticeState, this.error, this.valueOrNull});

  T? valueOrNull;
  Object? error;
  NoticeStateEnum noticeState;

  T get value => valueOrNull!;
}

class Empty<T> extends NoticeState<T> {
  final T data;

  Empty({required this.data}) : super(noticeState: NoticeStateEnum.empty);
}

class Loading<T> extends NoticeState<T> {
  Loading() : super(noticeState: NoticeStateEnum.loading);
}

class Error<T> extends NoticeState<T> {
  final Object error;

  Error({required this.error})
      : super(noticeState: NoticeStateEnum.error, error: error);
}

class Loaded<T> extends NoticeState<T> {
  final T data;

  Loaded({required this.data})
      : super(noticeState: NoticeStateEnum.loaded, valueOrNull: data);
}
