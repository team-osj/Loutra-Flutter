import 'dart:async';
import 'dart:convert';

import 'package:apply_data/dto/request/apply_cancel_request.dart';
import 'package:apply_data/dto/request/get_apply_list_request.dart';
import 'package:apply_data/dto/request/send_fcm_info_request.dart';
import 'package:apply_data/dto/response/apply_response.dart';
import 'package:core/secret.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;

class RemoteApplyDataSource {
  Future<String> _getToken() async =>
      await FirebaseMessaging.instance.getToken() ?? "whatThe";

  Future<List<ApplyResponse>> getApplyList() async {
    GetApplyListRequest getApplyListRequest =
        GetApplyListRequest(token: await _getToken());
    final response = await http.post(Uri.parse("$baseurl/push_list"),
        body: json.encode(getApplyListRequest.toJson()));
    if (response.statusCode != 200) throw Exception(response.body);
    return (jsonDecode(response.body) as List<dynamic>)
        .map((i) => ApplyResponse.fromJson(i))
        .toList();
  }

  Future<void> sendFCMInfo(
      {required int deviceId, required int expectState}) async {
    SendFCMInfoRequest sendFCMInfoRequest = SendFCMInfoRequest(
        deviceId: deviceId, expectState: expectState, token: await _getToken());
    final response = await http.post(Uri.parse("$baseurl/push_request"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(sendFCMInfoRequest.toJson()));
    if (response.statusCode != 200 && response.statusCode != 304) {
      throw Exception(response.body);
    }
  }

  Future<void> applyCancel({required int deviceId}) async {
    ApplyCancelRequest applyCancelRequest =
        ApplyCancelRequest(deviceId: deviceId, token: await _getToken());
    final response = await http.post(Uri.parse("$baseurl/push_cancel"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(applyCancelRequest.toJson()));
    if (response.statusCode != 200) throw Exception(response.body);
  }
}
