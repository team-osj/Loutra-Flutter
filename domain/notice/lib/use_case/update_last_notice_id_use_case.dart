import 'package:notice_domain/entity/notice_entity.dart';
import 'package:notice_domain/repository/notice_repository.dart';

class UpdateLastNoticeIdUseCase {
  final NoticeRepository _noticeRepository;

  UpdateLastNoticeIdUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;

  Future<void> execute({required List<NoticeEntity> noticeList}) =>
      _noticeRepository.setLastNoticeId(
          key: "lastNoticeId",
          value: noticeList.isEmpty ? -1 : noticeList.first.noticeId);
}
