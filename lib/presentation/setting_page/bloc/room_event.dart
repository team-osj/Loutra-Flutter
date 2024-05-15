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

class ModifyLaundryRoomLayerEvent extends RoomEvent {
  final LaundryRoomLayer laundryRoomLayer;

  ModifyLaundryRoomLayerEvent({required this.laundryRoomLayer});
}

class ShowBottomSheetEvent extends RoomEvent {}

class InitialShowBottomSheetEvent extends RoomEvent {}

class ShowingBottomSheetEvent extends RoomEvent {}

class ClosingBottomSheetEvent extends RoomEvent {}
