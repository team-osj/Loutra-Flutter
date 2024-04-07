import 'package:lotura/domain/entity/notice_entity.dart';

class NoticeResponse {
  final int id;
  final String title;
  final String contents;
  final String date;

  NoticeResponse({
    required this.id,
    required this.title,
    required this.contents,
    required this.date,
  });

  factory NoticeResponse.fromJson(Map<String, dynamic> json) {
    return NoticeResponse(
      id: json['id'],
      title: json['title'],
      contents: json['contents'],
      date: json['date'],
    );
  }

  NoticeEntity toEntity() {
    return NoticeEntity(
      title: title,
      contents: contents,
      date: date,
    );
  }
}
