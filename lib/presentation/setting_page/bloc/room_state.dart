enum RoomStateEnum { initial, changed }

sealed class RoomState<T> {
  RoomState({required this.roomState, required this.value, this.error});

  T value;
  Object? error;
  RoomStateEnum roomState;
}

class Initial<T> extends RoomState<T> {
  final T data;

  Initial({required this.data})
      : super(roomState: RoomStateEnum.initial, value: data);
}

class Changed<T> extends RoomState<T> {
  final T data;

  Changed({required this.data})
      : super(roomState: RoomStateEnum.changed, value: data);
}
