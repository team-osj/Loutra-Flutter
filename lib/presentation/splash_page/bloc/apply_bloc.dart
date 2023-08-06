import 'package:lotura/presentation/splash_page/bloc/apply_event.dart';
import 'package:lotura/presentation/splash_page/bloc/apply_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/data/repository/apply_repository.dart';

class ApplyBloc extends Bloc<ApplyEvent, ApplyState> {
  final ApplyRepository _repository;

  ApplyBloc(this._repository) : super(Empty()) {
    on<GetApplyListEvent>((event, emit) async {
      try {
        _repository.init();
        emit(Loading());
        await for (var value in _repository.applyStream) {
          emit(Loaded(applyList: value));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
