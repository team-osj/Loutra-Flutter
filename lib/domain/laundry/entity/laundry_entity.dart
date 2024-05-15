import 'package:lotura/main.dart';

class LaundryEntity {
  final int id;
  final int viewId;
  final CurrentState state;
  final DeviceType deviceType;

  const LaundryEntity({
    required this.id,
    required this.viewId,
    required this.state,
    required this.deviceType,
  });
}
