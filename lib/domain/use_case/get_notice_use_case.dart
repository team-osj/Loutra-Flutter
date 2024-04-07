import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/domain/repository/notice_repository.dart';

class GetNoticeUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;

  Future<List<NoticeEntity>> execute() => _noticeRepository.getNotice();
}
