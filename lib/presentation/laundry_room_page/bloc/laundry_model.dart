import 'package:lotura/domain/laundry/entity/laundry_entity.dart';

class LaundryModel {
  final List<LaundryEntity> laundryList;

  const LaundryModel({
    required this.laundryList,
  });

  LaundryModel copyWith({List<LaundryEntity>? laundryList}) {
    return LaundryModel(
      laundryList: laundryList ?? this.laundryList,
    );
  }
}
