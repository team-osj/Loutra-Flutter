import 'package:lotura/domain/laundry/entity/laundry_entity.dart';
import 'package:lotura/main.dart';

class LaundryResponse {
  final int id;
  final int viewId;
  final int state;
  final String deviceType;

  const LaundryResponse({
    required this.id,
    required this.viewId,
    required this.state,
    required this.deviceType,
  });

  factory LaundryResponse.fromJson(Map<String, dynamic> json) {
    return LaundryResponse(
      id: json['id'],
      viewId: json['view_id'],
      state: json['state'],
      deviceType: json['device_type'],
    );
  }

  LaundryEntity toEntity() {
    return LaundryEntity(
      id: id,
      viewId: viewId,
      state: CurrentState.values.elementAt(state),
      deviceType: deviceType == "WASH"
          ? DeviceType.wash
          : deviceType == "DRY"
              ? DeviceType.dry
              : DeviceType.empty,
    );
  }
}
