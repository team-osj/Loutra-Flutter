import 'package:apply_data/data_source/remote/remote_apply_data_source.dart';
import 'package:apply_data/dto/response/apply_response.dart';
import 'package:apply_data/repository/apply_repository.dart';

class ApplyRepositoryImpl implements ApplyRepository {
  final RemoteApplyDataSource _remoteApplyDataSource;

  const ApplyRepositoryImpl(
      {required RemoteApplyDataSource remoteApplyDataSource})
      : _remoteApplyDataSource = remoteApplyDataSource;

  @override
  Future<void> applyCancel({required int deviceId}) =>
      _remoteApplyDataSource.applyCancel(deviceId: deviceId);

  @override
  Future<List<ApplyResponse>> getApplyList() =>
      _remoteApplyDataSource.getApplyList();

  @override
  Future<void> sendFCMInfo({required int deviceId, required int expectState}) =>
      _remoteApplyDataSource.sendFCMInfo(
          deviceId: deviceId, expectState: expectState);
}
