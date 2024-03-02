enum LaundryStateEnum { empty, loading, error, loaded }

sealed class LaundryState<T> {
  LaundryState({required this.laundryState, this.error, this.valueOrNull});

  T? valueOrNull;
  Object? error;
  LaundryStateEnum laundryState;

  T get value => valueOrNull!;
}

class Empty<T> extends LaundryState<T> {
  Empty() : super(laundryState: LaundryStateEnum.empty);
}

class Loading<T> extends LaundryState<T> {
  Loading() : super(laundryState: LaundryStateEnum.loading);
}

class Error<T> extends LaundryState<T> {
  final Object error;

  Error({required this.error})
      : super(laundryState: LaundryStateEnum.error, error: error);
}

class Loaded<T> extends LaundryState<T> {
  final T data;

  Loaded({required this.data})
      : super(laundryState: LaundryStateEnum.loaded, valueOrNull: data);
}
