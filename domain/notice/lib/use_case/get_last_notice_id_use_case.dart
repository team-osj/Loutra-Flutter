import 'package:notice_domain/entity/notice_entity.dart';
import 'package:notice_domain/repository/notice_repository.dart';

class GetLastNoticeIdUseCase {
  final NoticeRepository _noticeRepository;

  const GetLastNoticeIdUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;

  bool execute({required List<NoticeEntity> noticeList}) {
    int lastNoticeId =
        _noticeRepository.getLastNoticeId(key: "lastNoticeId") ?? -1;
    int newNoticeId = noticeList.isEmpty ? -1 : noticeList.first.noticeId;
    return lastNoticeId < newNoticeId;
  }
}
