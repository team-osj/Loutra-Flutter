import 'package:lotura/presentation/splash_page/bloc/osj_event.dart';
import 'package:lotura/presentation/splash_page/bloc/osj_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/data/repository/osj_repository.dart';

class OSJBloc extends Bloc<OSJEvent, OSJState> {
  final OSJRepository _repository;

  OSJBloc(this._repository) : super(Empty()) {
    on<GetOSJEvent>((event, emit) async {
      try {
        _repository.init();
        emit(Loading());
        await for (var value in _repository.osjStream) {
          emit(Loaded(osjList: value));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}