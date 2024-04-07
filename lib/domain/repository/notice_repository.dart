import 'dart:async';

import 'package:lotura/domain/entity/notice_entity.dart';

abstract class NoticeRepository {
  Future<List<NoticeEntity>> getNotice();
}
