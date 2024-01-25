import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/response/apply_response.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class ApplyCancelUseCase {
  final ApplyRepository _applyRepository;

  ApplyCancelUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyResponse>> execute(
          {required ApplyCancelRequest applyCancelRequest}) =>
      _applyRepository.applyCancel(applyCancelRequest: applyCancelRequest);
}
