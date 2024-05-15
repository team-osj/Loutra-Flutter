import 'package:lotura/main.dart';

class LaundryRoomModel {
  final RoomLocation roomLocation;
  final LaundryRoomLayer laundryRoomLayer;
  final bool isClick, isNFCShowBottomSheet, showingBottomSheet;

  const LaundryRoomModel({
    required this.roomLocation,
    required this.laundryRoomLayer,
    required this.isClick,
    required this.isNFCShowBottomSheet,
    required this.showingBottomSheet,
  });

  LaundryRoomModel copyWith(
      {RoomLocation? roomLocation,
      LaundryRoomLayer? laundryRoomLayer,
      bool? isClick,
      bool? isNFCShowBottomSheet,
      bool? showingBottomSheet}) {
    return LaundryRoomModel(
        roomLocation: roomLocation ?? this.roomLocation,
        laundryRoomLayer: laundryRoomLayer ?? this.laundryRoomLayer,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet: isNFCShowBottomSheet ?? this.isNFCShowBottomSheet,
        showingBottomSheet: showingBottomSheet ?? this.showingBottomSheet);
  }
}
