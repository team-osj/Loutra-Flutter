import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/use_case/get_all_laundry_list_use_case.dart';
import 'package:lotura/domain/use_case/get_laundry_status_use_case.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_model.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';

class LaundryBloc extends Bloc<LaundryEvent, LaundryState<List<LaundryModel>>> {
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
      Emitter<LaundryState<List<LaundryModel>>> emit) async {
    try {
      _getLaundryStatusUseCase.execute();
      await for (var data in _getLaundryStatusUseCase.laundryList) {
        final newState = state.value
            .map((e) => e.laundryEntity.id == data.id
                ? LaundryModel(laundryEntity: data)
                : e)
            .toList();
        emit(Loaded(data: newState));
      }
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _getAllLaundryListEventHandler(GetAllLaundryListEvent event,
      Emitter<LaundryState<List<LaundryModel>>> emit) async {
    try {
      emit(Loading());
      final newState = await _getAllLaundryListEventUseCase.execute();
      final laundryModelList =
          newState.map((e) => LaundryModel(laundryEntity: e)).toList();
      emit(Loaded(data: laundryModelList));
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
