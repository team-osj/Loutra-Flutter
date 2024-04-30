import 'dart:async';

import 'package:notice_data/dto/response/notice_response.dart';

abstract class NoticeRepository {
  Future<List<NoticeResponse>> getNotice();

  Future<void> setLastNoticeId({required String key, required int value});

  int? getLastNoticeId({required String key});
}
