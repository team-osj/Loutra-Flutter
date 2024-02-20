import 'package:lotura/main.dart';

abstract class RoomEvent {}

class GetRoomIndexEvent extends RoomEvent {}

class UpdateRoomIndexEvent extends RoomEvent {
  final RoomLocation roomLocation;

  UpdateRoomIndexEvent({required this.roomLocation});
}

class ModifyRoomIndexEvent extends RoomEvent {
  final RoomLocation roomLocation;

  ModifyRoomIndexEvent({required this.roomLocation});
}

class ModifyPlaceIconIndexEvent extends RoomEvent {
  final int placeIconIndex;

  ModifyPlaceIconIndexEvent({required this.placeIconIndex});
}

class ShowBottomSheetEvent extends RoomEvent {}

class InitialShowBottomSheetEvent extends RoomEvent {}
