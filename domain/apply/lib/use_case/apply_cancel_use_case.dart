import 'package:apply_data/repository/apply_repository.dart';

class ApplyCancelUseCase {
  final ApplyRepository _applyRepository;

  const ApplyCancelUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<void> execute({required int deviceId}) =>
      _applyRepository.applyCancel(deviceId: deviceId);
}
