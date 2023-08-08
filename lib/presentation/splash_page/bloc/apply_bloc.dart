import 'dart:async';

import 'package:lotura/presentation/splash_page/bloc/apply_event.dart';
import 'package:lotura/presentation/splash_page/bloc/apply_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/data/repository/apply_repository.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
  final ApplyRepository _repository;

  ApplyBloc(this._repository) : super(Empty()) {
    on<GetApplyListEvent>((event, emit) async {
      try {
        emit(Loading());
        _repository.applyListRequest();
        _repository.response();
        await for (var value in _repository.applyStream) {
          emit(Loaded(applyList: value));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
    on<SendFCMEvent>((event, emit) async {
      try {
        emit(Loading());
        _repository.sendFCMInfo(event.deviceId);
        Future.delayed(const Duration(milliseconds: 500))
            .then((value) => _repository.applyListRequest());
        emit(SendCompletion());
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
    on<ApplyCancelEvent>((event, emit) async {
      try {
        emit(Loading());
        _repository.applyCancel(event.deviceId);
        Future.delayed(const Duration(milliseconds: 500))
            .then((value) => _repository.applyListRequest());
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
