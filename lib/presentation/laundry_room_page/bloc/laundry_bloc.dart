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

  void _getLaundryEventHandler(
      GetLaundryEvent event, Emitter<LaundryState> emit) async {
    try {
      _getLaundryStatusUseCase.execute();
      emit(Loading());
    } catch (e) {
      emit(Error(error: e));
    }
  }

  void _getAllLaundryListEventHandler(
      GetAllLaundryListEvent event, Emitter<LaundryState> emit) async {
    try {
      emit(Loading());
      final laundryList = await _getAllLaundryListEventUseCase.execute();
      emit(Loaded(data: laundryList));
    } catch (e) {
      emit(Error(error: e));
    }
  }
}
