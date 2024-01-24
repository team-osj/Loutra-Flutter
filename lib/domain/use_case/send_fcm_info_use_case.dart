import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class SendFCMInfoUseCase {
  final ApplyRepository _applyRepository;

  SendFCMInfoUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyResponse>> execute(
      {required SendFCMInfoRequest sendFCMInfoRequest}) async {
    await _applyRepository.sendFCMInfo(sendFCMInfoRequest: sendFCMInfoRequest);
    return _applyRepository.getApplyList();
  }
}
