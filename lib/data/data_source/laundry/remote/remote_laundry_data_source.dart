import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/secret.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteLaundryDataSource {
  final StreamController<LaundryResponse> _streamController;
  final WebSocketChannel _channel;

  RemoteLaundryDataSource(
      {required StreamController<LaundryResponse> streamController,
      required WebSocketChannel channel})
      : _streamController = streamController,
        _channel = channel;

  Stream<LaundryResponse> get laundryList =>
      _streamController.stream.asBroadcastStream();

  void webSocketInit() {
    _channel.stream.listen((data) {
      _streamController.sink.add(LaundryResponse.fromJson(data));
    });
  }

  Future<List<LaundryResponse>> getAllLaundryList() async {
    final response = await http.get(Uri.parse("$baseurl/device_list"));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return (jsonDecode(response.body) as List<dynamic>)
        .map((i) => LaundryResponse.fromJson(i))
        .toList();
  }
}
