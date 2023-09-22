import 'package:equatable/equatable.dart';
import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';

abstract class ApplyEvent extends Equatable {}

class GetApplyListEvent extends ApplyEvent {
  @override
  List<Object?> get props => [];
}

class ApplyCancelEvent extends ApplyEvent {
  final ApplyCancelRequest applyCancelRequest;

  ApplyCancelEvent({required this.applyCancelRequest});

  @override
  List<Object?> get props => [applyCancelRequest];
}

class SendFCMEvent extends ApplyEvent {
  final SendFCMInfoRequest sendFCMInfoRequest;

  SendFCMEvent({required this.sendFCMInfoRequest});

  @override
  List<Object?> get props => [sendFCMInfoRequest];
}
