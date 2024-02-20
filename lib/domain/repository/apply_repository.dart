import 'dart:async';

import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/domain/entity/apply_entity.dart';

abstract class ApplyRepository {
  Future<List<ApplyEntity>> getApplyList();

  Future<void> sendFCMInfo({required SendFCMInfoRequest sendFCMInfoRequest});

  Future<List<ApplyEntity>> applyCancel(
      {required ApplyCancelRequest applyCancelRequest});
}
