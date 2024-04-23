import 'package:lotura/main.dart';

class LaundryRoomModel {
  final RoomLocation roomLocation;
  final ButtonView buttonView;
  final bool isClick, isNFCShowBottomSheet, showingBottomSheet;

  const LaundryRoomModel({
    required this.roomLocation,
    required this.buttonView,
    required this.isClick,
    required this.isNFCShowBottomSheet,
    required this.showingBottomSheet,
  });

  LaundryRoomModel copyWith(
      {RoomLocation? roomLocation,
      ButtonView? buttonView,
      bool? isClick,
      bool? isNFCShowBottomSheet,
      bool? showingBottomSheet}) {
    return LaundryRoomModel(
        roomLocation: roomLocation ?? this.roomLocation,
        buttonView: buttonView ?? this.buttonView,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet: isNFCShowBottomSheet ?? this.isNFCShowBottomSheet,
        showingBottomSheet: showingBottomSheet ?? this.showingBottomSheet);
  }
}
