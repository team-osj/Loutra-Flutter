import 'package:apply_data/repository/apply_repository.dart';
import 'package:apply_domain/entity/apply_entity.dart';
import 'package:apply_domain/mapper/apply_mapper.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  const GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyEntity>> execute() async {
    final applyResponse = await _applyRepository.getApplyList();
    return applyResponse
        .map((e) => ApplyMapper.toEntity(applyResponse: e))
        .toList();
  }
}
