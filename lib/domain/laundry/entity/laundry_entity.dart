import 'package:lotura/main.dart';

class LaundryEntity {
  final int id;
  final CurrentState state;
  final DeviceType deviceType;

  const LaundryEntity({
    required this.id,
    required this.state,
    required this.deviceType,
  });
}
