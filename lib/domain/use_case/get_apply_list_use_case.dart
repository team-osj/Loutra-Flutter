import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyResponse>> execute() => _applyRepository.getApplyList();
}
