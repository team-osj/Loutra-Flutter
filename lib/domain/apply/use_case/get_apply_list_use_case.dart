import 'package:lotura/domain/apply/entity/apply_entity.dart';
import 'package:lotura/domain/apply/repository/apply_repository.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyEntity>> execute() => _applyRepository.getApplyList();
}
