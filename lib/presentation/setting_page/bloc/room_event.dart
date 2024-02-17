abstract class RoomEvent {}

class GetRoomIndexEvent extends RoomEvent {}

class UpdateRoomIndexEvent extends RoomEvent {
  final int value;

  UpdateRoomIndexEvent({required this.value});
}
