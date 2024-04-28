import 'package:core/current_state.dart';
import 'package:core/device_type.dart';
import 'package:laundry_data/dto/response/laundry_response.dart';
import 'package:laundry_domain/entity/laundry_entity.dart';

class LaundryMapper {
  LaundryMapper._();

  static LaundryEntity toEntity({required LaundryResponse laundryResponse}) {
    return LaundryEntity(
      id: laundryResponse.id,
      state: CurrentState.values.elementAt(laundryResponse.state),
      deviceType: laundryResponse.deviceType == "WASH"
          ? DeviceType.wash
          : DeviceType.dry,
    );
  }
}
