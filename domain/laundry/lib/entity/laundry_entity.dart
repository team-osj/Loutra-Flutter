import 'package:core/current_state.dart';
import 'package:core/device_type.dart';

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
