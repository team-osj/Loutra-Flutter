import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class SendFCMInfoUseCase {
  final ApplyRepository _applyRepository;

  SendFCMInfoUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  void execute(SendFCMInfoRequest sendFCMInfoRequest) {
    _applyRepository.sendFCMInfo(sendFCMInfoRequest);
    _applyRepository.getApplyList(GetApplyListRequest());
  }
}
