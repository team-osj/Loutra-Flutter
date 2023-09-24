import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class GetApplyListUseCase {
  final ApplyRepository _applyRepository;

  GetApplyListUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Stream<List<ApplyResponse>> get applyList => _applyRepository.applyStream;

  void execute() {
    _applyRepository.getApplyList(GetApplyListRequest());
    _applyRepository.response();
  }
}
