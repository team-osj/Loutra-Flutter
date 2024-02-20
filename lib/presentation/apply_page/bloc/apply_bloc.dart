import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/entity/apply_entity.dart';
import 'package:lotura/domain/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState<List<ApplyEntity>>> {
  final GetApplyListUseCase _getApplyListUseCase;
  final SendFCMInfoUseCase _sendFCMInfoUseCase;
  final ApplyCancelUseCase _applyCancelUseCase;

  ApplyBloc(
      {required GetApplyListUseCase getApplyListUseCase,
      required SendFCMInfoUseCase sendFCMInfoUseCase,
      required ApplyCancelUseCase applyCancelUseCase})
      : _getApplyListUseCase = getApplyListUseCase,
        _sendFCMInfoUseCase = sendFCMInfoUseCase,
        _applyCancelUseCase = applyCancelUseCase,
        super(Empty()) {
    on<GetApplyListEvent>(_getApplyListEventHandler);
    on<SendFCMEvent>(_sendFCMEventHandler);
    on<ApplyCancelEvent>(_applyCancelEventHandler);
  }

  void _getApplyListEventHandler(GetApplyListEvent event,
      Emitter<ApplyState<List<ApplyEntity>>> emit) async {
    try {
      emit(Loading());
      emit(Loaded(data: await _getApplyListUseCase.execute()));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }

  void _sendFCMEventHandler(
      SendFCMEvent event, Emitter<ApplyState<List<ApplyEntity>>> emit) async {
    try {
      emit(Loading());
      final applyList = await _sendFCMInfoUseCase.execute(
          sendFCMInfoRequest: event.sendFCMInfoRequest);
      emit(Loaded(data: applyList));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }

  void _applyCancelEventHandler(ApplyCancelEvent event,
      Emitter<ApplyState<List<ApplyEntity>>> emit) async {
    try {
      emit(Loading());
      final applyList = await _applyCancelUseCase.execute(
          applyCancelRequest: event.applyCancelRequest);
      emit(Loaded(data: applyList));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }
}
