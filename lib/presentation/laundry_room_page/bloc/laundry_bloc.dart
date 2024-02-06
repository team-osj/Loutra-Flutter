import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/domain/use_case/get_all_laundry_list_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc
    extends Bloc<LaundryEvent, LaundryState<List<LaundryResponse>>> {
  final GetLaundryStatusUseCase _getLaundryStatusUseCase;
  final GetAllLaundryListUseCase _getAllLaundryListEventUseCase;

  LaundryBloc(
      {required GetLaundryStatusUseCase getLaundryStatusUseCase,
      required GetAllLaundryListUseCase getAllLaundryListUseCase})
      : _getLaundryStatusUseCase = getLaundryStatusUseCase,
        _getAllLaundryListEventUseCase = getAllLaundryListUseCase,
        super(Empty()) {
    on<GetLaundryEvent>(_getLaundryEventHandler);
    on<GetAllLaundryListEvent>(_getAllLaundryListEventHandler);
  }

  void _getLaundryEventHandler(GetLaundryEvent event,
      Emitter<LaundryState<List<LaundryResponse>>> emit) async {
    try {
      emit(Loading());
      _getLaundryStatusUseCase.execute();
      await for (var data in _getLaundryStatusUseCase.laundryList) {
        final newState = Loaded(
            data: state.valueOrNull!
                .map((e) => e.id == data.id
                    ? LaundryResponse(
                        id: data.id,
                        state: data.state,
                        deviceType: data.deviceType)
                    : e)
                .toList());
        emit(newState);
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _getAllLaundryListEventHandler(GetAllLaundryListEvent event,
      Emitter<LaundryState<List<LaundryResponse>>> emit) async {
    try {
      emit(Loading());
      final newState =
          Loaded(data: await _getAllLaundryListEventUseCase.execute());
      emit(newState);
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
