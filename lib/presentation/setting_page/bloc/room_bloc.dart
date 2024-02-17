import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/domain/use_case/get_laundry_room_index_use_case.dart';
import 'package:lotura/domain/use_case/update_laundry_room_index_use_case.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState<RoomEntity>> {
  final GetLaundryRoomIndexUseCase _getLaundryRoomIndexUseCase;
  final UpdateLaundryRoomIndexUseCase _updateLaundryRoomIndexUseCase;

  RoomBloc(
      {required GetLaundryRoomIndexUseCase getLaundryRoomIndexUseCase,
      required UpdateLaundryRoomIndexUseCase updateLaundryRoomIndexUseCase})
      : _getLaundryRoomIndexUseCase = getLaundryRoomIndexUseCase,
        _updateLaundryRoomIndexUseCase = updateLaundryRoomIndexUseCase,
        super(Initial(
            data: const RoomEntity(
                roomIndex: 0,
                placeIconIndex: 1,
                isClick: false,
                isNFCShowBottomSheet: false))) {
    on<UpdateRoomIndexEvent>(_updateRoomIndexEventHandler);
    on<GetRoomIndexEvent>(_getRoomIndexEventHandler);
  }

  void _updateRoomIndexEventHandler(
      UpdateRoomIndexEvent event, Emitter<RoomState<RoomEntity>> emit) {
    emit(Changed(data: state.value.copyWith(roomIndex: event.value)));
    _updateLaundryRoomIndexUseCase.execute(value: event.value);
  }

  void _getRoomIndexEventHandler(
      GetRoomIndexEvent event, Emitter<RoomState<RoomEntity>> emit) {
    emit(Changed(
        data: state.value
            .copyWith(roomIndex: _getLaundryRoomIndexUseCase.execute)));
  }
}
