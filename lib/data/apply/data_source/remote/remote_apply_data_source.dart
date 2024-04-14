import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:lotura/data/apply/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/apply/dto/request/send_fcm_info_request.dart';
import 'package:lotura/data/apply/dto/response/apply_response.dart';
import 'package:lotura/domain/apply/entity/apply_entity.dart';
import 'package:lotura/secret.dart';

class RemoteApplyDataSource {
  Future<String> _getToken() async =>
      await FirebaseMessaging.instance.getToken() ?? "whatThe";

  Future<List<ApplyEntity>> getApplyList() async {
    final response = await http.post(Uri.parse("$baseurl/push_list"),
        body: {"token": await _getToken()});
    if (response.statusCode != 200) throw Exception(response.body);
    return (jsonDecode(response.body) as List<dynamic>)
        .map((i) => ApplyResponse.fromJson(i).toEntity())
        .toList();
  }

  Future<void> sendFCMInfo(
      {required SendFCMInfoRequest sendFCMInfoRequest}) async {
    sendFCMInfoRequest.token = await _getToken();
    final response = await http.post(Uri.parse("$baseurl/push_request"),
        body: sendFCMInfoRequest.toJson());
    if (response.statusCode != 200 && response.statusCode != 304) {
      throw Exception(response.body);
    }
  }

  Future<void> applyCancel(
      {required ApplyCancelRequest applyCancelRequest}) async {
    applyCancelRequest.token = await _getToken();
    final response = await http.post(Uri.parse("$baseurl/push_cancel"),
        body: applyCancelRequest.toJson());
    if (response.statusCode != 200) throw Exception(response.body);
  }
}
