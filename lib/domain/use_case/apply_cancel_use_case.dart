import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class ApplyCancelUseCase {
  final ApplyRepository _applyRepository;

  ApplyCancelUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  void execute(ApplyCancelRequest applyCancelRequest) {
    _applyRepository.applyCancel(applyCancelRequest);
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => _applyRepository.getApplyList(GetApplyListRequest()));
  }
}
