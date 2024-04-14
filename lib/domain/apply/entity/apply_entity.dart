import 'package:lotura/main.dart';

class ApplyEntity {
  final int deviceId;
  final String deviceType;
  final Machine machine;

  ApplyEntity({required this.deviceId, required this.deviceType})
      : machine = deviceType == "WASH" ? Machine.wash : Machine.dry;
}
