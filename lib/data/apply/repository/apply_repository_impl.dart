import 'dart:async';

import 'package:lotura/data/apply/data_source/remote/remote_apply_data_source.dart';
import 'package:lotura/data/apply/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/apply/dto/request/send_fcm_info_request.dart';
import 'package:lotura/domain/apply/entity/apply_entity.dart';
import 'package:lotura/domain/apply/repository/apply_repository.dart';

class ApplyRepositoryImpl implements ApplyRepository {
  final RemoteApplyDataSource _remoteApplyDataSource;

  ApplyRepositoryImpl({required RemoteApplyDataSource remoteApplyDataSource})
      : _remoteApplyDataSource = remoteApplyDataSource;

  @override
  Future<List<ApplyEntity>> getApplyList() async =>
      _remoteApplyDataSource.getApplyList();

  @override
  Future<void> sendFCMInfo(
          {required SendFCMInfoRequest sendFCMInfoRequest}) async =>
      _remoteApplyDataSource.sendFCMInfo(
          sendFCMInfoRequest: sendFCMInfoRequest);

  @override
  Future<List<ApplyEntity>> applyCancel(
          {required ApplyCancelRequest applyCancelRequest}) async =>
      _remoteApplyDataSource.applyCancel(
          applyCancelRequest: applyCancelRequest);
}
