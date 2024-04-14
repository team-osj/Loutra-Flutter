import 'package:lotura/main.dart';

class ApplyModel {
  final int deviceId;
  final String deviceType;
  final Machine machine;

  const ApplyModel({
    required this.deviceId,
    required this.deviceType,
    required this.machine,
  });

  ApplyModel copyWith({int? deviceId, String? deviceType, Machine? machine}) {
    return ApplyModel(
      deviceId: deviceId ?? this.deviceId,
      deviceType: deviceType ?? this.deviceType,
      machine: machine ?? this.machine,
    );
  }
}
