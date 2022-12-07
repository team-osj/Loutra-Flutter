import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:osj_flutter/baseurl.dart';

Future<void> getFcm() async {
  var token = await FirebaseMessaging.instance.getToken();
  print(token);
  final response = await http.get(Uri.parse(
      '$fcmurl?token=$token&device_id=0&exp_state=1'));
  if (response.statusCode == 200) {
    print(response.body);
  } else print('안뜸');
}
