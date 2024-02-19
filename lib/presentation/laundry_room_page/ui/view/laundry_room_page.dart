import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/response/laundry_response.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_button.dart';
import 'package:lotura/presentation/utils/machine_card.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';
import 'package:lotura/presentation/utils/osj_bottom_sheet.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';

class LaundryRoomPage extends StatefulWidget {
  LaundryRoomPage({super.key, required this.nfcTagData});

  int nfcTagData;

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage>
    with WidgetsBindingObserver {
  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  final Map placeIndex = <int, int>{0: 0, 1: 16, 2: 31};

  final Map status = <int, Status>{
    0: Status.working,
    1: Status.available,
    2: Status.disconnected,
    3: Status.breakdown
  };

  final Map machine = <String, Machine>{
    "WASH": Machine.wash,
    "DRY": Machine.dry
  };

  Widget triangle({required RoomEntity roomEntity}) =>
      roomEntity.placeIconIndex == 0
          ? const SizedBox.shrink()
          : const Icon(LoturaIcons.triangleUp, color: Colors.grey);

  MachineWidget machineWidget(
          {required RoomEntity roomState,
          required int index,
          required Status status,
          required Machine machine}) =>
      roomState.placeIconIndex == 0
          ? MachineCard(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomIndex == 2 ? true : false,
              status: status,
              machine: machine)
          : MachineButton(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomIndex == 2 ? true : false,
              status: status,
              machine: machine);

  @override
  void initState() {
    super.initState();
    context.read<RoomBloc>().add(GetRoomIndexEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState<RoomEntity>>(
      builder: (context, roomBlocState) {
        if (roomBlocState is Changed) {
          return Scaffold(
            backgroundColor: OSJColors.gray100,
            appBar: AppBar(
              backgroundColor: OSJColors.gray100,
              elevation: 0.0,
              leadingWidth: 300.0.w,
              leading: Row(
                children: [
                  SizedBox(width: 24.0.w),
                  Text(
                    place[roomBlocState.value.roomIndex],
                    style: TextStyle(
                      color: OSJColors.black,
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    context.read<RoomBloc>().add(GetRoomIndexEvent());
                    return const SettingPage();
                  })),
                  icon: Icon(Icons.settings, color: OSJColors.black),
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
                          function: () => context
                              .read<RoomBloc>()
                              .add(ModifyRoomIndexEvent(roomIndex: 0)),
                          width: 99.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomIndex == 0
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: roomBlocState.value.roomIndex == 0
                              ? OSJColors.primary700
                              : OSJColors.gray300,
                          text: "남자 학교측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => context
                              .read<RoomBloc>()
                              .add(ModifyRoomIndexEvent(roomIndex: 1)),
                          width: 111.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomIndex == 1
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: roomBlocState.value.roomIndex == 1
                              ? OSJColors.primary700
                              : OSJColors.gray300,
                          text: "남자 기숙사측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => context
                              .read<RoomBloc>()
                              .add(ModifyRoomIndexEvent(roomIndex: 2)),
                          width: 53.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: roomBlocState.value.roomIndex == 2
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: roomBlocState.value.roomIndex == 2
                              ? OSJColors.primary700
                              : OSJColors.gray300,
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
                        onPressed: () => context
                            .read<RoomBloc>()
                            .add(ModifyPlaceIconIndexEvent(placeIconIndex: 0)),
                        icon: Icon(LoturaIcons.grid,
                            size: 18.0.r,
                            color: roomBlocState.value.placeIconIndex == 0
                                ? OSJColors.black
                                : OSJColors.gray300),
                      ),
                      IconButton(
                          onPressed: () => context.read<RoomBloc>().add(
                              ModifyPlaceIconIndexEvent(placeIconIndex: 1)),
                          icon: Icon(
                            LoturaIcons.list,
                            size: 18.0.r,
                            color: roomBlocState.value.placeIconIndex == 1
                                ? OSJColors.black
                                : OSJColors.gray300,
                          )),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<LaundryBloc,
                        LaundryState<List<LaundryResponse>>>(
                      builder: (context, state) {
                        return switch (state) {
                          Empty() => const Center(child: Text("비어있음")),
                          Loading() =>
                            const Center(child: CircularProgressIndicator()),
                          Error() =>
                            Center(child: Text(state.error.toString())),
                          Loaded() => LaundryList(
                              list: state.data,
                              roomEntity: roomBlocState.value,
                              nfcData: widget.nfcTagData,
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
  LaundryList(
      {super.key,
      required this.list,
      required this.roomEntity,
      required this.nfcData});

  final List<LaundryResponse> list;
  final RoomEntity roomEntity;
  final int nfcData;

  final Map placeIndex = <int, int>{0: 0, 1: 16, 2: 31};

  final Map status = <int, Status>{
    0: Status.working,
    1: Status.available,
    2: Status.disconnected,
    3: Status.breakdown
  };

  final Map machine = <String, Machine>{
    "WASH": Machine.wash,
    "DRY": Machine.dry
  };

  Widget triangle({required RoomEntity roomEntity}) =>
      roomEntity.placeIconIndex == 0
          ? const SizedBox.shrink()
          : const Icon(LoturaIcons.triangleUp, color: Colors.grey);

  MachineWidget machineWidget(
          {required RoomEntity roomState,
          required int index,
          required Status status,
          required Machine machine}) =>
      roomState.placeIconIndex == 0
          ? MachineCard(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomIndex == 2 ? true : false,
              status: status,
              machine: machine)
          : MachineButton(
              index: index,
              isEnableNotification: true,
              isWoman: roomState.roomIndex == 2 ? true : false,
              status: status,
              machine: machine);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (nfcData != -1 && roomEntity.isNFCShowBottomSheet == false) {
        context.read<RoomBloc>().add(ShowBottomSheetEvent());
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
            status: status[list[nfcData - 1].state],
            machine: machine[list[nfcData - 1].deviceType],
          ),
        );
      }
    });
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: roomEntity.roomIndex == 2 ? 10 : 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  machineWidget(
                      roomState: roomEntity,
                      index: list[placeIndex[roomEntity.roomIndex] + index].id,
                      machine: machine[
                          list[placeIndex[roomEntity.roomIndex] + index]
                              .deviceType],
                      status: status[
                          list[placeIndex[roomEntity.roomIndex] + index]
                              .state]),
                  triangle(roomEntity: roomEntity),
                  machineWidget(
                    roomState: roomEntity,
                    index: placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8) <
                            44
                        ? list[placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8)]
                            .id
                        : -1,
                    machine: placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8) <
                            44
                        ? machine[list[placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8)]
                            .deviceType]
                        : Machine.dry,
                    status: placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8) <
                            44
                        ? status[list[placeIndex[roomEntity.roomIndex] +
                                index +
                                (roomEntity.roomIndex == 2 ? 10 : 8)]
                            .state]
                        : Status.breakdown,
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
