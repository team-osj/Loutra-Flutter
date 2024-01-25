import 'dart:async';

import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';

abstract class ApplyRepository {
  Future<List<ApplyResponse>> getApplyList();

  Future<void> sendFCMInfo({required SendFCMInfoRequest sendFCMInfoRequest});

  Future<List<ApplyResponse>> applyCancel(
      {required ApplyCancelRequest applyCancelRequest});
}
