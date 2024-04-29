import 'package:notice_data/dto/response/notice_response.dart';
import 'package:notice_domain/entity/notice_entity.dart';

class NoticeMapper {
  NoticeMapper._();

  static NoticeEntity toEntity({required NoticeResponse noticeResponse}) {
    return NoticeEntity(
      noticeId: noticeResponse.id,
      title: noticeResponse.title,
      contents: noticeResponse.contents,
      date: noticeResponse.date,
    );
  }
}
