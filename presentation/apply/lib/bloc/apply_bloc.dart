import 'package:apply_domain/entity/apply_entity.dart';
import 'package:apply_domain/use_case/apply_cancel_use_case.dart';
import 'package:apply_domain/use_case/get_apply_list_use_case.dart';
import 'package:apply_domain/use_case/send_fcm_info_use_case.dart';
import 'package:apply_presentation/bloc/apply_event.dart';
import 'package:apply_presentation/bloc/apply_model.dart';
import 'package:apply_presentation/bloc/apply_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      bool isDeviceInApplyList =
          state.value.applyList.any((e) => e.deviceId == event.deviceId);
      switch (isDeviceInApplyList) {
        case true:
          break;
        case false:
          {
            List<ApplyEntity> applyList = state.value.applyList;
            emit(Loading());
            await _sendFCMInfoUseCase.execute(
                deviceId: event.deviceId, expectState: 1);
            applyList.add(ApplyEntity(
                deviceId: event.deviceId, deviceType: event.deviceType));
            applyList.sort((a, b) => a.deviceId.compareTo(b.deviceId));
            final applyModel = ApplyModel(applyList: applyList);
            emit(Loaded(data: applyModel));
            break;
          }
      }
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }

  void _applyCancelEventHandler(
      ApplyCancelEvent event, Emitter<ApplyState<ApplyModel>> emit) async {
    try {
      List<ApplyEntity> newApplyList = state.value.applyList;
      emit(Loading());
      await _applyCancelUseCase.execute(deviceId: event.deviceId);
      newApplyList.removeWhere((e) => e.deviceId == event.deviceId);
      final applyModel = ApplyModel(applyList: newApplyList);
      emit(Loaded(data: applyModel));
    } catch (e) {
      emit(Error(errorMessage: e));
    }
  }
}
