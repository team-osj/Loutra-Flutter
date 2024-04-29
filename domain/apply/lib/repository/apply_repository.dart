import 'dart:async';

import 'package:apply_domain/entity/apply_entity.dart';

abstract interface class ApplyRepository {
  Future<List<ApplyEntity>> getApplyList();

  Future<void> sendFCMInfo({required int deviceId, required int expectState});

  Future<void> applyCancel({required int deviceId});
}
