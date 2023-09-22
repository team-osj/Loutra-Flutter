import 'dart:async';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';

abstract class ApplyRepository {
  Stream<List<ApplyResponse>> get applyStream;

  void applyListRequest();

  void response();

  void sendFCMInfo(SendFCMInfoRequest sendFCMInfoRequest);

  void applyCancel(int deviceId);
}
