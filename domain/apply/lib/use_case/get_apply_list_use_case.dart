import 'package:apply_domain/entity/apply_entity.dart';
import 'package:apply_domain/repository/apply_repository.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  const GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyEntity>> execute() async => _applyRepository.getApplyList();
}
