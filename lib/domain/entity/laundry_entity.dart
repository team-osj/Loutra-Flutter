import 'package:lotura/main.dart';

class LaundryEntity {
  final int id;
  final CurrentState state;
  final Machine deviceType;

  LaundryEntity({
    required this.id,
    required int state,
    required String deviceType,
  })  : state = CurrentState.values.elementAt(state),
        deviceType = deviceType == "WASH" ? Machine.wash : Machine.dry;
}
