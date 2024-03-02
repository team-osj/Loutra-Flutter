import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/entity/laundry_entity.dart';
import 'package:lotura/domain/use_case/get_all_laundry_list_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc
    extends Bloc<LaundryEvent, LaundryState<List<LaundryEntity>>> {
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
      Emitter<LaundryState<List<LaundryEntity>>> emit) async {
    try {
      _getLaundryStatusUseCase.execute();
      await for (var data in _getLaundryStatusUseCase.laundryList) {
        final newState = Loaded(
            data: state.value
                .map((e) => e.id == data.id
                    ? LaundryEntity(
                        id: data.id,
                        state: data.state.index,
                        deviceType: data.deviceType.name.toUpperCase())
                    : e)
                .toList());
        emit(newState);
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _getAllLaundryListEventHandler(GetAllLaundryListEvent event,
      Emitter<LaundryState<List<LaundryEntity>>> emit) async {
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
