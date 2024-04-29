enum RoomLocation {
  schoolSide(roomName: "남자 학교측 세탁실"),
  dormitorySide(roomName: "남자 기숙사측 세탁실"),
  womanRoom(roomName: "여자 세탁실");

  const RoomLocation({required this.roomName});

  final String roomName;
}
