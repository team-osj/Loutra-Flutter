import 'package:apply_domain/entity/apply_entity.dart';

class ApplyModel {
  final List<ApplyEntity> applyList;

  ApplyModel({
    required this.applyList,
  });

  ApplyModel copyWith({List<ApplyEntity>? applyList}) {
    return ApplyModel(applyList: applyList ?? this.applyList);
  }
}
