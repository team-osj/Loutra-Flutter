import 'package:equatable/equatable.dart';

abstract class RoomEvent extends Equatable {}

class GetRoomIndexEvent extends RoomEvent {
  @override
  List<Object?> get props => [];
}

class UpdateRoomIndexEvent extends RoomEvent {
  final int value;

  UpdateRoomIndexEvent({required this.value});

  @override
  List<Object?> get props => [value];
}
