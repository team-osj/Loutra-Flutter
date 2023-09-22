import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/repository/laundry_repository.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc extends Bloc<LaundryEvent, LaundryState> {
  final LaundryRepository _repository;

  LaundryBloc(this._repository) : super(Empty()) {
    on<GetLaundryEvent>((event, emit) async {
      try {
        _repository.init();
        emit(Loading());
        await for (var value in _repository.laundryList) {
          emit(Loaded(laundryResponseList: value));
        }
      } catch (e) {
        emit(Error(message: e.toString()));
      }
    });
  }
}
