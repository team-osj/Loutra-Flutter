import 'package:lotura/data/apply/dto/request/get_apply_list_request.dart';
import 'package:lotura/main.dart';

abstract class ApplyEvent {}

class GetApplyListEvent extends ApplyEvent {
  final GetApplyListRequest getApplyListRequest;

  GetApplyListEvent({required this.getApplyListRequest});
}

class ApplyCancelEvent extends ApplyEvent {
  final int deviceId;

  ApplyCancelEvent({
    required this.deviceId,
  });
}

class SendFCMEvent extends ApplyEvent {
  final int deviceId;
  final Machine deviceType;

  SendFCMEvent({
    required this.deviceId,
    required this.deviceType,
  });
}
