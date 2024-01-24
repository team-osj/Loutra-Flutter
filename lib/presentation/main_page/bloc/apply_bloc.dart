import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/use_case/apply_cancel_use_case.dart';
import 'package:lotura/domain/use_case/get_apply_list_use_case.dart';
import 'package:lotura/domain/use_case/send_fcm_info_use_case.dart';
import 'package:lotura/presentation/main_page/bloc/apply_event.dart';
import 'package:lotura/presentation/main_page/bloc/apply_state.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
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
      GetApplyListEvent event, Emitter<ApplyState> emit) async {
    try {
      emit(Loading());
      emit(Loaded(applyList: await _getApplyListUseCase.execute()));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _sendFCMEventHandler(
      SendFCMEvent event, Emitter<ApplyState> emit) async {
    try {
      emit(Loading());
      _sendFCMInfoUseCase.execute(event.sendFCMInfoRequest);
      Future.delayed(const Duration(milliseconds: 400))
          .then((value) => _getApplyListUseCase.execute());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _applyCancelEventHandler(
      ApplyCancelEvent event, Emitter<ApplyState> emit) async {
    try {
      emit(Loading());
      _applyCancelUseCase.execute(event.applyCancelRequest);
      Future.delayed(const Duration(milliseconds: 400))
          .then((value) => _getApplyListUseCase.execute());
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
