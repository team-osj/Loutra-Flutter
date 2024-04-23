import 'package:lotura/data/apply/dto/request/send_fcm_info_request.dart';
import 'package:lotura/domain/apply/repository/apply_repository.dart';

class SendFCMInfoUseCase {
  final ApplyRepository _applyRepository;

  SendFCMInfoUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<void> execute({required SendFCMInfoRequest sendFCMInfoRequest}) =>
      _applyRepository.sendFCMInfo(sendFCMInfoRequest: sendFCMInfoRequest);
}
