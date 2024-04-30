import 'dart:async';

import 'package:notice_domain/entity/notice_entity.dart';

abstract class NoticeRepository {
  Future<List<NoticeEntity>> getNotice();

  Future<void> setLastNoticeId({required String key, required int value});

  int? getLastNoticeId({required String key});
}
