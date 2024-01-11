import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';

class LaundryRoomPage extends StatefulWidget {
  const LaundryRoomPage({super.key});

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage> {
  int isSelectedIcon = 1, isSelectedPlace = 0;
  bool isClick = false;

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

  Widget get triangle => isSelectedIcon == 0
      ? const SizedBox.shrink()
      : const Icon(LoturaIcons.triangleUp, color: Colors.grey);

  Widget machineWidget(
          {required int index,
          required Status status,
          required Machine machine}) =>
      isSelectedIcon == 0
          ? MachineCard(
              index: index,
              isEnableNotification: true,
              isWoman: isSelectedPlace == 2 ? true : false,
              status: status,
              machine: machine)
          : MachineButton(
              index: index,
              isEnableNotification: true,
              isWoman: isSelectedPlace == 2 ? true : false,
              status: status,
              machine: machine);

  @override
  void initState() {
    super.initState();
    context.read<RoomBloc>().add(GetRoomIndexEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState>(
      builder: (context, roomBlocState) {
        if (roomBlocState is Changed) {
          if (!isClick) {
            isSelectedPlace = roomBlocState.index;
            isClick = true;
          }
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
                    place[isSelectedPlace],
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
                          function: () => setState(() => isSelectedPlace = 0),
                          width: 99.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: isSelectedPlace == 0
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: isSelectedPlace == 0
                              ? OSJColors.primary700
                              : OSJColors.gray300,
                          text: "남자 학교측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => setState(() => isSelectedPlace = 1),
                          width: 111.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: isSelectedPlace == 1
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: isSelectedPlace == 1
                              ? OSJColors.primary700
                              : OSJColors.gray300,
                          text: "남자 기숙사측",
                          radius: 8.0,
                        ),
                        SizedBox(width: 8.0.w),
                        OSJTextButton(
                          function: () => setState(() => isSelectedPlace = 2),
                          width: 53.0.w,
                          height: 32.0.h,
                          fontSize: 16.0.sp,
                          color: isSelectedPlace == 2
                              ? OSJColors.white
                              : OSJColors.gray100,
                          fontColor: isSelectedPlace == 2
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
                        onPressed: () {
                          setState(() {
                            isSelectedIcon = 0;
                          });
                        },
                        icon: Icon(LoturaIcons.grid,
                            size: 18.0.r,
                            color: isSelectedIcon == 0
                                ? OSJColors.black
                                : OSJColors.gray300),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isSelectedIcon = 1;
                            });
                          },
                          icon: Icon(
                            LoturaIcons.list,
                            size: 18.0.r,
                            color: isSelectedIcon == 1
                                ? OSJColors.black
                                : OSJColors.gray300,
                          )),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<LaundryBloc, LaundryState>(
                      builder: (context, state) {
                        if (state is Empty) {
                          return const Center(child: Text("비어있음"));
                        } else if (state is Loading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is Error) {
                          return Center(child: Text(state.message));
                        } else if (state is Loaded) {
                          return ScrollConfiguration(
                            behavior: const ScrollBehavior()
                                .copyWith(overscroll: false),
                            child: ListView.builder(
                              itemCount: isSelectedPlace == 2 ? 10 : 8,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        machineWidget(
                                            index: state
                                                .laundryResponseList[placeIndex[
                                                        isSelectedPlace] +
                                                    index]
                                                .id,
                                            machine: machine[state
                                                .laundryResponseList[placeIndex[
                                                        isSelectedPlace] +
                                                    index]
                                                .deviceType],
                                            status: status[state
                                                .laundryResponseList[placeIndex[
                                                        isSelectedPlace] +
                                                    index]
                                                .state]),
                                        triangle,
                                        machineWidget(
                                          index: placeIndex[isSelectedPlace] +
                                                      index +
                                                      (isSelectedPlace == 2
                                                          ? 10
                                                          : 8) <
                                                  44
                                              ? state
                                                  .laundryResponseList[
                                                      placeIndex[
                                                              isSelectedPlace] +
                                                          index +
                                                          (isSelectedPlace == 2
                                                              ? 10
                                                              : 8)]
                                                  .id
                                              : -1,
                                          machine: placeIndex[isSelectedPlace] +
                                                      index +
                                                      (isSelectedPlace == 2
                                                          ? 10
                                                          : 8) <
                                                  44
                                              ? machine[state
                                                  .laundryResponseList[
                                                      placeIndex[
                                                              isSelectedPlace] +
                                                          index +
                                                          (isSelectedPlace == 2
                                                              ? 10
                                                              : 8)]
                                                  .deviceType]
                                              : Machine.dry,
                                          status: placeIndex[isSelectedPlace] +
                                                      index +
                                                      (isSelectedPlace == 2
                                                          ? 10
                                                          : 8) <
                                                  44
                                              ? status[state
                                                  .laundryResponseList[
                                                      placeIndex[
                                                              isSelectedPlace] +
                                                          index +
                                                          (isSelectedPlace == 2
                                                              ? 10
                                                              : 8)]
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
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
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
