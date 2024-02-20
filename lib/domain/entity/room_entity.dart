import 'package:lotura/main.dart';

class RoomEntity {
  final RoomLocation roomLocation;
  final int placeIconIndex;
  final bool isClick, isNFCShowBottomSheet;

  const RoomEntity({
    required this.roomLocation,
    required this.placeIconIndex,
    required this.isClick,
    required this.isNFCShowBottomSheet,
  });

  RoomEntity copyWith(
      {RoomLocation? roomLocation,
      int? placeIconIndex,
      bool? isClick,
      bool? isNFCShowBottomSheet}) {
    return RoomEntity(
        roomLocation: roomLocation ?? this.roomLocation,
        placeIconIndex: placeIconIndex ?? this.placeIconIndex,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet:
            isNFCShowBottomSheet ?? this.isNFCShowBottomSheet);
  }
}
