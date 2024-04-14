import 'package:lotura/data/notice/data_source/local/local_notice_data_source.dart';
import 'package:lotura/data/notice/data_source/remote/remote_notice_data_source.dart';
import 'package:lotura/domain/notice/entity/notice_entity.dart';
import 'package:lotura/domain/notice/repository/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final RemoteNoticeDataSource _remoteNoticeDataSource;
  final LocalNoticeDataSource _localNoticeDataSource;

  const NoticeRepositoryImpl({
    required RemoteNoticeDataSource remoteNoticeDataSource,
    required LocalNoticeDataSource localNoticeDataSource,
  })  : _remoteNoticeDataSource = remoteNoticeDataSource,
        _localNoticeDataSource = localNoticeDataSource;

  @override
  Future<List<NoticeEntity>> getNotice() => _remoteNoticeDataSource.getNotice();

  @override
  int? getLastNoticeId({required String key}) =>
      _localNoticeDataSource.getValue(key: key);

  @override
  Future<void> setLastNoticeId({required String key, required int value}) =>
      _localNoticeDataSource.setValue(key: key, value: value);
}
