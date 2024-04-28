import 'dart:async';

import 'package:apply_data/dto/response/apply_response.dart';

abstract interface class ApplyRepository {
  Future<List<ApplyResponse>> getApplyList();

  Future<void> sendFCMInfo({required int deviceId, required int expectState});

  Future<void> applyCancel({required int deviceId});
}
