import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lotura/data/laundry/dto/response/laundry_response.dart';
import 'package:lotura/domain/laundry/entity/laundry_entity.dart';
import 'package:lotura/secret.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class RemoteLaundryDataSource {
  final StreamController<LaundryEntity> _streamController;

  RemoteLaundryDataSource(
      {required StreamController<LaundryEntity> streamController})
      : _streamController = streamController;

  Stream<LaundryEntity> get laundryList =>
      _streamController.stream.asBroadcastStream();

  void webSocketInit() async {
    final channel = WebSocketChannel.connect(Uri.parse(webSocketUrl));
    await channel.ready;
    channel.stream.listen((data) {
      _streamController.sink.add(
          LaundryResponse.fromJson(jsonDecode(data) as Map<String, dynamic>)
              .toEntity());
    });
  }

  Future<List<LaundryEntity>> getAllLaundryList() async {
    final response = await http.get(Uri.parse("$baseurl/device_list_boy"));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return (jsonDecode(response.body) as List<dynamic>)
        .map((i) => LaundryResponse.fromJson(i).toEntity())
        .toList();
  }
}
