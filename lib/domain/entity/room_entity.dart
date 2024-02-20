import 'package:lotura/main.dart';

class LaundryRoomEntity {
  final RoomLocation roomLocation;
  final ButtonView buttonView;
  final bool isClick, isNFCShowBottomSheet;

  const LaundryRoomEntity({
    required this.roomLocation,
    required this.buttonView,
    required this.isClick,
    required this.isNFCShowBottomSheet,
  });

  LaundryRoomEntity copyWith(
      {RoomLocation? roomLocation,
      ButtonView? buttonView,
      bool? isClick,
      bool? isNFCShowBottomSheet}) {
    return LaundryRoomEntity(
        roomLocation: roomLocation ?? this.roomLocation,
        buttonView: buttonView ?? this.buttonView,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet:
            isNFCShowBottomSheet ?? this.isNFCShowBottomSheet);
  }
}
