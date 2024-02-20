import 'package:lotura/domain/entity/apply_entity.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyEntity>> execute() => _applyRepository.getApplyList();
}
