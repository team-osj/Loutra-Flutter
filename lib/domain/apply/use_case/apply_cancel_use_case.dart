import 'package:lotura/data/apply/dto/request/apply_cancel_request.dart';
import 'package:lotura/domain/apply/repository/apply_repository.dart';

class ApplyCancelUseCase {
  final ApplyRepository _applyRepository;

  ApplyCancelUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<void> execute({required ApplyCancelRequest applyCancelRequest}) =>
      _applyRepository.applyCancel(applyCancelRequest: applyCancelRequest);
}
