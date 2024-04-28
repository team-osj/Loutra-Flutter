import 'package:core/device_type.dart';

abstract class ApplyEvent {}

class GetApplyListEvent extends ApplyEvent {}

class ApplyCancelEvent extends ApplyEvent {
  final int deviceId;

  ApplyCancelEvent({
    required this.deviceId,
  });
}

class SendFCMEvent extends ApplyEvent {
  final int deviceId;
  final DeviceType deviceType;

  SendFCMEvent({
    required this.deviceId,
    required this.deviceType,
  });
}
