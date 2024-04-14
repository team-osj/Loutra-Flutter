import 'package:lotura/data/apply/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/apply/dto/request/get_apply_list_request.dart';
import 'package:lotura/data/apply/dto/request/send_fcm_info_request.dart';

abstract class ApplyEvent {}

class GetApplyListEvent extends ApplyEvent {
  final GetApplyListRequest getApplyListRequest;

  GetApplyListEvent({required this.getApplyListRequest});
}

class ApplyCancelEvent extends ApplyEvent {
  final ApplyCancelRequest applyCancelRequest;

  ApplyCancelEvent({required this.applyCancelRequest});
}

class SendFCMEvent extends ApplyEvent {
  final SendFCMInfoRequest sendFCMInfoRequest;

  SendFCMEvent({required this.sendFCMInfoRequest});
}
