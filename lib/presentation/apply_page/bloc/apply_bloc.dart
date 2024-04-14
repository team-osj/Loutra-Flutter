import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/apply/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/apply/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/apply/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_model.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState<ApplyModel>> {
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

  void _getApplyListEventHandler(
      GetApplyListEvent event, Emitter<ApplyState<ApplyModel>> emit) async {
    try {
      emit(Loading());
      final applyList = await _getApplyListUseCase.execute();
      final applyModel = ApplyModel(applyList: applyList);
      emit((Loaded(data: applyModel)));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }

  void _sendFCMEventHandler(
      SendFCMEvent event, Emitter<ApplyState<ApplyModel>> emit) async {
    try {
      emit(Loading());
      final applyList = await _sendFCMInfoUseCase.execute(
          sendFCMInfoRequest: event.sendFCMInfoRequest);
      final applyModel = ApplyModel(applyList: applyList);
      emit(Loaded(data: applyModel));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }

  void _applyCancelEventHandler(
      ApplyCancelEvent event, Emitter<ApplyState<ApplyModel>> emit) async {
    try {
      emit(Loading());
      final applyList = await _applyCancelUseCase.execute(
          applyCancelRequest: event.applyCancelRequest);
      final applyModel = ApplyModel(applyList: applyList);
      emit(Loaded(data: applyModel));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }
}
