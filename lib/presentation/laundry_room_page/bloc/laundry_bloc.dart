import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/laundry/entity/laundry_entity.dart';
import 'package:lotura/domain/laundry/use_case/get_all_laundry_list_use_case.dart';
import 'package:lotura/domain/laundry/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_model.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc extends Bloc<LaundryEvent, LaundryState<LaundryModel>> {
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

  void _getLaundryEventHandler(
      GetLaundryEvent event, Emitter<LaundryState<LaundryModel>> emit) async {
    try {
      _getLaundryStatusUseCase.execute();
      await for (var data in _getLaundryStatusUseCase.laundryList) {
        final newLaundryModel = LaundryModel(
            laundryList: state.value.laundryList
                .map((e) => e.id == data.id
                    ? LaundryEntity(
                        id: e.id,
                        state: data.state.index,
                        deviceType: data.deviceType.text.toLowerCase())
                    : e)
                .toList());
        emit(Loaded(data: newLaundryModel));
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _getAllLaundryListEventHandler(GetAllLaundryListEvent event,
      Emitter<LaundryState<LaundryModel>> emit) async {
    try {
      emit(Loading());
      final newState = await _getAllLaundryListEventUseCase.execute();
      final newLaundryModel = LaundryModel(laundryList: newState);
      emit(Loaded(data: newLaundryModel));
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
