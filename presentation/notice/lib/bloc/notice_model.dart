import 'package:notice_domain/entity/notice_entity.dart';

class NoticeModel {
  final List<NoticeEntity> noticeList;
  final bool isNewNotice;

  const NoticeModel({
    required this.noticeList,
    required this.isNewNotice,
  });

  NoticeModel copyWith({List<NoticeEntity>? noticeList, bool? isNewNotice}) {
    return NoticeModel(
      noticeList: noticeList ?? this.noticeList,
      isNewNotice: isNewNotice ?? this.isNewNotice,
    );
  }
}
