enum ApplyStateEnum { empty, loading, error, loaded }

sealed class ApplyState<T> {
  ApplyState({required this.applyStateEnum, this.error, this.valueOrNull});

  T? valueOrNull;
  Object? error;
  ApplyStateEnum applyStateEnum;

  T get value => valueOrNull!;
}

class Empty<T> extends ApplyState<T> {
  Empty() : super(applyStateEnum: ApplyStateEnum.empty);
}

class Loading<T> extends ApplyState<T> {
  Loading() : super(applyStateEnum: ApplyStateEnum.loading);
}

class Error<T> extends ApplyState<T> {
  final Object errorMessage;

  Error({required this.errorMessage})
      : super(applyStateEnum: ApplyStateEnum.error, error: errorMessage);
}

class Loaded<T> extends ApplyState<T> {
  final T data;

  Loaded({required this.data})
      : super(applyStateEnum: ApplyStateEnum.loaded, valueOrNull: data);
}
