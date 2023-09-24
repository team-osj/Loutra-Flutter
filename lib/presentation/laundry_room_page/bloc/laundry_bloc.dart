import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc extends Bloc<LaundryEvent, LaundryState> {
  final GetLaundryStatusUseCase _getLaundryStatusUseCase;

  LaundryBloc({required GetLaundryStatusUseCase getLaundryStatusUseCase})
      : _getLaundryStatusUseCase = getLaundryStatusUseCase,
        super(Empty()) {
    on<GetLaundryEvent>(_getLaundryEventHandler);
  }

  void _getLaundryEventHandler(
      GetLaundryEvent event, Emitter<LaundryState> emit) async {
    try {
      _getLaundryStatusUseCase.execute();
      emit(Loading());
      await for (var value in _getLaundryStatusUseCase.laundryList) {
        emit(Loaded(laundryResponseList: value));
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
