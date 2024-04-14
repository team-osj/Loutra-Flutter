import 'package:lotura/domain/entity/laundry_entity.dart';

class LaundryModel {
  final LaundryEntity laundryEntity;

  const LaundryModel({
    required this.laundryEntity,
  });

  LaundryModel copyWith({LaundryEntity? laundryEntity}) {
    return LaundryModel(
      laundryEntity: laundryEntity ?? this.laundryEntity,
    );
  }
}
