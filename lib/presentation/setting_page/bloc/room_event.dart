abstract class RoomEvent {}

class GetRoomIndexEvent extends RoomEvent {}

class UpdateRoomIndexEvent extends RoomEvent {
  final int roomIndex;

  UpdateRoomIndexEvent({required this.roomIndex});
}

class ModifyRoomIndexEvent extends RoomEvent {
  final int roomIndex;

  ModifyRoomIndexEvent({required this.roomIndex});
}

class ModifyPlaceIconIndexEvent extends RoomEvent {
  final int placeIconIndex;

  ModifyPlaceIconIndexEvent({required this.placeIconIndex});
}

class ShowBottomSheetEvent extends RoomEvent {}

class InitialShowBottomSheetEvent extends RoomEvent {}
