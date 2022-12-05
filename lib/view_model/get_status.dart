import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osj_flutter/model/list_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

Stream<OsjList> getStatus() async* {
  final WebSocketChannel channel = IOWebSocketChannel.connect('http://127.0.0.1:8080/jsonData');
}
