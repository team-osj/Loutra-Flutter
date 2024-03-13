import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/laundry_entity.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_button.dart';
import 'package:lotura/presentation/utils/machine_card.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';
import 'package:lotura/presentation/utils/osj_bottom_sheet.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';

class LaundryRoomPage extends StatelessWidget {
  LaundryRoomPage({super.key, required this.nfcTagData});

  final int nfcTagData;

  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState<LaundryRoomEntity>>(
      builder: (context, roomBlocState) {
        if (roomBlocState is Changed) {
          return Scaffold(
            backgroundColor: LoturaColors.gray100,
            appBar: AppBar(
              backgroundColor: LoturaColors.gray100,
              elevation: 0.0,
              leadingWidth: 300.0.w,
              leading: Row(
                children: [
                  SizedBox(width: 24.0.w),
                  Text(
                    roomBlocState.value.roomLocation.roomName,
                    style: TextStyle(
                      color: LoturaColors.black,
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPage())),
                  icon: Icon(Icons.settings, color: LoturaColors.black),
                ),
                SizedBox(width: 24.0.w),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12.0.h,
                      bottom: 12.0.h,
                    ),
                    child: Row(
                      children: [
                        OSJTextButton(
                          function: () => context.read<RoomBloc>().add(
                              ModifyRoomIndexEvent(
                                  roomLocation: RoomLocation.schoolSide)),
                          width: 99.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomLocation ==
                                  RoomLocation.schoolSide
                              ? LoturaColors.white
                              : LoturaColors.gray100,
                          fontColor: roomBlocState.value.roomLocation ==
                                  RoomLocation.schoolSide
                              ? LoturaColors.primary700
                              : LoturaColors.gray300,
                          text: "남자 학교측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => context.read<RoomBloc>().add(
                              ModifyRoomIndexEvent(
                                  roomLocation: RoomLocation.dormitorySide)),
                          width: 111.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomLocation ==
                                  RoomLocation.dormitorySide
                              ? LoturaColors.white
                              : LoturaColors.gray100,
                          fontColor: roomBlocState.value.roomLocation ==
                                  RoomLocation.dormitorySide
                              ? LoturaColors.primary700
                              : LoturaColors.gray300,
                          text: "남자 기숙사측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => context.read<RoomBloc>().add(
                              ModifyRoomIndexEvent(
                                  roomLocation: RoomLocation.womanRoom)),
                          width: 53.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomLocation ==
                                  RoomLocation.womanRoom
                              ? LoturaColors.white
                              : LoturaColors.gray100,
                          fontColor: roomBlocState.value.roomLocation ==
                                  RoomLocation.womanRoom
                              ? LoturaColors.primary700
                              : LoturaColors.gray300,
                          text: "여자",
                          radius: 8.0,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => context.read<RoomBloc>().add(
                            ModifyButtonViewEvent(
                                buttonView: ButtonView.image)),
                        icon: Icon(LoturaIcons.grid,
                            size: 18.0.r,
                            color: roomBlocState.value.buttonView ==
                                    ButtonView.image
                                ? LoturaColors.black
                                : LoturaColors.gray300),
                      ),
                      IconButton(
                          onPressed: () => context.read<RoomBloc>().add(
                              ModifyButtonViewEvent(
                                  buttonView: ButtonView.icon)),
                          icon: Icon(
                            LoturaIcons.list,
                            size: 18.0.r,
                            color: roomBlocState.value.buttonView ==
                                    ButtonView.icon
                                ? LoturaColors.black
                                : LoturaColors.gray300,
                          )),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<LaundryBloc,
                        LaundryState<List<LaundryEntity>>>(
                      builder: (context, state) {
                        return switch (state) {
                          Empty() => const Center(child: Text("비어있음")),
                          Loading() =>
                            const Center(child: CircularProgressIndicator()),
                          Error() =>
                            const Center(child: Text("인터넷 연결을 확인해주세요")),
                          Loaded() => LaundryList(
                              list: state.data,
                              roomEntity: roomBlocState.value,
                              nfcData: nfcTagData,
                            ),
                        };
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class LaundryList extends StatelessWidget {
  LaundryList({
    super.key,
    required this.list,
    required this.roomEntity,
    required this.nfcData,
  });

  final List<LaundryEntity> list;
  final LaundryRoomEntity roomEntity;
  final int nfcData;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  MachineWidget machineWidget(
          {required LaundryRoomEntity roomState,
          required int index,
          required CurrentState state,
          required Machine machine}) =>
      roomState.buttonView == ButtonView.image
          ? MachineCard(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomLocation == RoomLocation.womanRoom,
              state: state,
              machine: machine)
          : MachineButton(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomLocation == RoomLocation.womanRoom,
              state: state,
              machine: machine);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (nfcData != -1 && roomEntity.isNFCShowBottomSheet == false) {
          if (roomEntity.showingBottomSheet == true) {
            Navigator.of(context).pop();
          }
          context.read<RoomBloc>().add(ShowBottomSheetEvent());
          context.read<RoomBloc>().add(ShowingBottomSheetEvent());
          showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.r),
              ),
            ),
            builder: (context) => OSJBottomSheet(
              index: nfcData,
              isEnableNotification: true,
              isWoman: nfcData > 31 ? true : false,
              state: list[nfcData - 1].state,
              machine: list[nfcData - 1].deviceType,
            ),
          );
        }
      },
    );
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: roomEntity.roomLocation == RoomLocation.womanRoom ? 10 : 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  machineWidget(
                      roomState: roomEntity,
                      index: list[placeIndex[roomEntity.roomLocation.index]! +
                              index]
                          .id,
                      machine: list[placeIndex[roomEntity.roomLocation.index]! +
                              index]
                          .deviceType,
                      state: list[placeIndex[roomEntity.roomLocation.index]! +
                              index]
                          .state),
                  roomEntity.buttonView.triangle,
                  machineWidget(
                    roomState: roomEntity,
                    index: placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8) <
                            44
                        ? list[placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8)]
                            .id
                        : -1,
                    machine: placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8) <
                            44
                        ? list[placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8)]
                            .deviceType
                        : Machine.dry,
                    state: placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8) <
                            44
                        ? list[placeIndex[roomEntity.roomLocation.index]! +
                                index +
                                (roomEntity.roomLocation ==
                                        RoomLocation.womanRoom
                                    ? 10
                                    : 8)]
                            .state
                        : CurrentState.breakdown,
                  ),
                ],
              ),
              SizedBox(height: 10.0.h),
            ],
          );
        },
      ),
    );
  }
}
