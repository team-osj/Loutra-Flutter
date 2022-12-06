import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:osj_flutter/model/list_model.dart';

Stream<OsjList> getStatus() async* {
  final response =
      await http.get(Uri.parse('http://pnxelec.iptime.org:1600/query.php'));
  var token = await FirebaseMessaging.instance.getToken();
  if (response.statusCode == 200) {
    print(response.body);
    print(token);
    yield OsjList.fromJson(jsonDecode(response.body));
  } else
    throw Exception('실패');
}
