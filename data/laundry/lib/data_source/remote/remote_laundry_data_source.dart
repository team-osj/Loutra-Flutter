import 'dart:async';
import 'dart:convert';

import 'package:core/secret.dart';
import 'package:http/http.dart' as http;
import 'package:laundry_data/dto/response/laundry_response.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteLaundryDataSource {
  final StreamController<LaundryResponse> _streamController;

  const RemoteLaundryDataSource(
      {required StreamController<LaundryResponse> streamController})
      : _streamController = streamController;

  Stream<LaundryResponse> get laundryList =>
      _streamController.stream.asBroadcastStream();

  void webSocketInit() async {
    final channel = WebSocketChannel.connect(Uri.parse(webSocketUrl));
    await channel.ready;
    channel.stream.listen((data) {
      _streamController.sink.add(
          LaundryResponse.fromJson(jsonDecode(data) as Map<String, dynamic>));
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
