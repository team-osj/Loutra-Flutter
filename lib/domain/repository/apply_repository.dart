import 'dart:async';
import 'package:lotura/domain/model/apply_response_list.dart';

abstract class ApplyRepository {
  final StreamController<ApplyResponseList> _streamController;

  ApplyRepository(this._streamController);

  Future<String> _getToken();

  Stream<ApplyResponseList> get applyStream;

  void applyListRequest();

  void response();

  void sendFCMInfo(int deviceId);

  void applyCancel(int deviceId);
}
