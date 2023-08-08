import 'package:equatable/equatable.dart';

abstract class ApplyEvent extends Equatable {}

class GetApplyListEvent extends ApplyEvent {
  @override
  List<Object?> get props => [];
}

class ApplyCancelEvent extends ApplyEvent {
  final int deviceId;

  ApplyCancelEvent(this.deviceId);

  @override
  List<Object?> get props => [deviceId];
}

class SendFCMEvent extends ApplyEvent {
  final int deviceId;

  SendFCMEvent(this.deviceId);

  @override
  List<Object?> get props => [];
}
