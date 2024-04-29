import 'package:notice/data_source/local/local_notice_data_source.dart';
import 'package:notice/data_source/remote/remote_notice_data_source.dart';
import 'package:notice/dto/response/notice_response.dart';
import 'package:notice/repository/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final RemoteNoticeDataSource _remoteNoticeDataSource;
  final LocalNoticeDataSource _localNoticeDataSource;

  const NoticeRepositoryImpl({
    required RemoteNoticeDataSource remoteNoticeDataSource,
    required LocalNoticeDataSource localNoticeDataSource,
  })  : _remoteNoticeDataSource = remoteNoticeDataSource,
        _localNoticeDataSource = localNoticeDataSource;

  @override
  Future<List<NoticeResponse>> getNotice() =>
      _remoteNoticeDataSource.getNotice();

  @override
  int? getLastNoticeId({required String key}) =>
      _localNoticeDataSource.getValue(key: key);

  @override
  Future<void> setLastNoticeId({required String key, required int value}) =>
      _localNoticeDataSource.setValue(key: key, value: value);
}
