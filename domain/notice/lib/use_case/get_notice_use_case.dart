import 'package:notice_data/repository/notice_repository.dart';
import 'package:notice_domain/entity/notice_entity.dart';
import 'package:notice_domain/mapper/notice_mapper.dart';

class GetNoticeUseCase {
  final NoticeRepository _noticeRepository;

  GetNoticeUseCase({required NoticeRepository noticeRepository})
      : _noticeRepository = noticeRepository;

  Future<List<NoticeEntity>> execute() async {
    final noticeResponseList = await _noticeRepository.getNotice();
    return noticeResponseList
        .map((e) => NoticeMapper.toEntity(noticeResponse: e))
        .toList();
  }
}
