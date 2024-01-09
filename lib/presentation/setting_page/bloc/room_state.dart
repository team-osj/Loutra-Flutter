import 'package:equatable/equatable.dart';

abstract class RoomState extends Equatable {}

class Initial extends RoomState {
  @override
  List<Object> get props => [];
}

class Changed extends RoomState {
  final int index;

  Changed({required this.index});

  @override
  List<Object> get props => [index];
}
