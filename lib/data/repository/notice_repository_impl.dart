import 'package:lotura/data/data_source/notice/remote/remote_notice_data_source.dart';
import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/domain/repository/notice_repository.dart';

class NoticeRepositoryImpl implements NoticeRepository {
  final RemoteNoticeDataSource _remoteNoticeDataSource;

  NoticeRepositoryImpl({required RemoteNoticeDataSource remoteNoticeDataSource})
      : _remoteNoticeDataSource = remoteNoticeDataSource;

  @override
  Future<List<NoticeEntity>> getNotice() => _remoteNoticeDataSource.getNotice();
}
