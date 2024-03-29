import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/domain/entity/apply_entity.dart';
import 'package:lotura/domain/repository/apply_repository.dart';

class ApplyCancelUseCase {
  final ApplyRepository _applyRepository;

  ApplyCancelUseCase({required ApplyRepository applyRepository})
      : _applyRepository = applyRepository;

  Future<List<ApplyEntity>> execute(
          {required ApplyCancelRequest applyCancelRequest}) =>
      _applyRepository.applyCancel(applyCancelRequest: applyCancelRequest);
}
