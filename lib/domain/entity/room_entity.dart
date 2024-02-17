class RoomEntity {
  final int roomIndex, placeIconIndex;
  final bool isClick, isNFCShowBottomSheet;

  const RoomEntity({
    required this.roomIndex,
    required this.placeIconIndex,
    required this.isClick,
    required this.isNFCShowBottomSheet,
  });

  RoomEntity copyWith(
      {int? roomIndex,
      int? placeIconIndex,
      bool? isClick,
      bool? isNFCShowBottomSheet}) {
    return RoomEntity(
        roomIndex: roomIndex ?? this.roomIndex,
        placeIconIndex: placeIconIndex ?? this.placeIconIndex,
        isClick: isClick ?? this.isClick,
        isNFCShowBottomSheet:
            isNFCShowBottomSheet ?? this.isNFCShowBottomSheet);
  }
}
