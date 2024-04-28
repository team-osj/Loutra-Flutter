import 'package:apply_data/dto/response/apply_response.dart';
import 'package:apply_domain/entity/apply_entity.dart';
import 'package:core/device_type.dart';

class ApplyMapper {
  ApplyMapper._();

  static ApplyEntity toEntity({required ApplyResponse applyResponse}) {
    return ApplyEntity(
        deviceId: applyResponse.deviceId,
        deviceType: applyResponse.deviceType == "WASH"
            ? DeviceType.wash
            : DeviceType.dry);
  }
}
