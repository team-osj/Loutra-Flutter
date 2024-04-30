import 'package:apply_domain/repository/apply_repository.dart';

class SendFCMInfoUseCase {
  final ApplyRepository _applyRepository;

  const SendFCMInfoUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<void> execute({required int deviceId, required int expectState}) =>
      _applyRepository.sendFCMInfo(
          deviceId: deviceId, expectState: expectState);
}
