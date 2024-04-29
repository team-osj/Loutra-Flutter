import 'dart:async';
import 'dart:convert';

import 'package:core/secret.dart';
import 'package:http/http.dart' as http;
import 'package:notice_data/dto/response/notice_response.dart';

class RemoteNoticeDataSource {
  Future<List<NoticeResponse>> getNotice() async {
    final response = await http.get(Uri.parse("$baseurl/notice"));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return (jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>)
        .map((i) => NoticeResponse.fromJson(i))
        .toList();
  }
}
