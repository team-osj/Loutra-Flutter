import 'package:apply_data/data_source/remote/remote_apply_data_source.dart';
import 'package:apply_data/mapper/apply_mapper.dart';
import 'package:apply_domain/entity/apply_entity.dart';
import 'package:apply_domain/repository/apply_repository.dart';

class ApplyRepositoryImpl implements ApplyRepository {
  final RemoteApplyDataSource _remoteApplyDataSource;

  const ApplyRepositoryImpl(
      {required RemoteApplyDataSource remoteApplyDataSource})
      : _remoteApplyDataSource = remoteApplyDataSource;

  @override
  Future<void> applyCancel({required int deviceId}) =>
      _remoteApplyDataSource.applyCancel(deviceId: deviceId);

  @override
  Future<List<ApplyEntity>> getApplyList() async {
    final applyResponseList = await _remoteApplyDataSource.getApplyList();
    return applyResponseList
        .map((e) => ApplyMapper.toEntity(applyResponse: e))
        .toList();
  }

  @override
  Future<void> sendFCMInfo({required int deviceId, required int expectState}) =>
      _remoteApplyDataSource.sendFCMInfo(
          deviceId: deviceId, expectState: expectState);
}
