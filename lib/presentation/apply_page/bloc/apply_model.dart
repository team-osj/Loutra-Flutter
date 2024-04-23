import 'package:lotura/domain/apply/entity/apply_entity.dart';

class ApplyModel {
  final List<ApplyEntity> applyList;

  ApplyModel({
    required this.applyList,
  });

  ApplyModel copyWith({List<ApplyEntity>? applyList}) {
    return ApplyModel(applyList: applyList ?? this.applyList);
  }
}
