import 'dart:async';
import 'package:lotura/data/dto/response/apply_response.dart';

abstract class ApplyRepository {
  Stream<List<ApplyResponse>> get applyStream;

  void applyListRequest();

  void response();

  void sendFCMInfo(int deviceId);

  void applyCancel(int deviceId);
}
