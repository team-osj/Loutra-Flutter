import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:osj_flutter/baseurl.dart';

Future<void> getFcm(int deviceId) async {
  var token = await FirebaseMessaging.instance.getToken();
  print(token);
  final response = await http
      .get(Uri.parse('$fcmUrl?token=$token&device_id=$deviceId&exp_state=1'));
  if (response.statusCode == 200) {
    print('성공');
    print(deviceId);
  } else
    print('안뜸');
}