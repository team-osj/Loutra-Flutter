import 'package:notice_domain/entity/notice_entity.dart';
import 'package:notice_domain/repository/notice_repository.dart';

class GetNoticeUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;

  Future<List<NoticeEntity>> execute() async => _noticeRepository.getNotice();
}
