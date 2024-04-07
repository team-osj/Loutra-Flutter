import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lotura/data/dto/response/notice_response.dart';
import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/secret.dart';

class RemoteNoticeDataSource {
  Future<List<NoticeEntity>> getNotice() async {
    final response = await http.get(Uri.parse("$baseurl/notice"));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>)
        .map((i) => NoticeResponse.fromJson(i).toEntity())
        .toList();
  }
}
