import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:osj_flutter/baseurl.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/view_model/get_fcm.dart';

Future<OsjList> getStatus() async {
  final response = await http.get(Uri.parse(baseurl));
  if (response.statusCode == 200) {
    print(response.body);
    await getFcm();
    return OsjList.fromJson(jsonDecode(response.body));
  } else
    throw Exception('실패');
}
