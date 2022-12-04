import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osj_flutter/model/model.dart';

Future<Osj> getStatus() async {
  final response =
      await http.get(Uri.parse('http://pnxelec.iptime.org:1600/query.php'));
  if (response.statusCode == 200) {
    print(response.body);
    return Osj.fromJson(jsonDecode(response.body));
  } else
    throw Exception('실패');
}
