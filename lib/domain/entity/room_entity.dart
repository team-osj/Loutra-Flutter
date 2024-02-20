import 'package:lotura/main.dart';

class RoomEntity {
  final RoomLocation roomLocation;
  final ButtonView buttonView;
  final bool isClick, isNFCShowBottomSheet;

  const RoomEntity({
    required this.roomLocation,
    required this.buttonView,
    required this.isClick,
    required this.isNFCShowBottomSheet,
  });

  RoomEntity copyWith(
      {RoomLocation? roomLocation,
      ButtonView? buttonView,
      bool? isClick,
      bool? isNFCShowBottomSheet}) {
    return RoomEntity(
        roomLocation: roomLocation ?? this.roomLocation,
        buttonView: buttonView ?? this.buttonView,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet:
            isNFCShowBottomSheet ?? this.isNFCShowBottomSheet);
  }
}
