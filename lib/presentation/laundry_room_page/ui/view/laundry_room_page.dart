import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;
import 'package:lotura/domain/laundry/entity/laundry_entity.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_model.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_state.dart';
import 'package:lotura/presentation/laundry_room_page/ui/widget/machine_button.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_bloc.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_event.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_model.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_state.dart' as n;
import 'package:lotura/presentation/notice_page/ui/view/notice_page.dart';
import 'package:lotura/presentation/setting_page/bloc/laundry_room_model.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/osj_bottom_sheet.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';

class LaundryRoomPage extends StatelessWidget {
  LaundryRoomPage({super.key, required this.nfcTagData});

  final int nfcTagData;

  final Map place = <int, String>{
    0: "남자 학교측 세탁실 1층",
    1: "남자 학교측 세탁실 2층",
    2: "남자 기숙사측 세탁실 1층",
    3: "남자 기숙사측 세탁실 2층",
    4: "여자 세탁실 1층",
  };

  final Map<int, int> placeIndex = {
    0: 0,
    1: 16,
    2: 31,
    3: 47,
    4: 63,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState<LaundryRoomModel>>(
      builder: (context, roomBlocState) {
        return switch (roomBlocState) {
          Initial() => const Center(child: CircularProgressIndicator()),
          Changed() => Scaffold(
              backgroundColor: LoturaColors.gray100,
              appBar: AppBar(
                backgroundColor: LoturaColors.gray100,
                elevation: 0.0,
                leadingWidth: MediaQuery.of(context).size.width,
                title: Padding(
                  padding: EdgeInsets.only(left: 10.r),
                  child: Text(
                    roomBlocState.value.roomLocation.roomName,
                    style: TextStyle(
                      color: LoturaColors.black,
                      fontSize: 22.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<NoticeBloc>().add(UpdateLastNoticeIdEvent());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NoticePage()));
                    },
                    icon: BlocBuilder<NoticeBloc, n.NoticeState<NoticeModel>>(
                      builder: (context, state) => state.value.isNewNotice
                          ? Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Icon(
                                  LoturaIcons.notice,
                                  color: LoturaColors.black,
                                  size: 24.0.r,
                                ),
                                Container(
                                  width: 10.0.r,
                                  height: 10.0.r,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            )
                          : Icon(
                              LoturaIcons.notice,
                              color: LoturaColors.black,
                              size: 24.0.r,
                            ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingPage())),
                    icon: Icon(
                      Icons.settings,
                      color: LoturaColors.black,
                      size: 28.0.r,
                    ),
                  ),
                  SizedBox(width: 24.0.w),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.only(
                  left: 24.0.w,
                  right: 24.0.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(vertical: 12.0.h),
                      child: Row(
                        children: [
                          OSJTextButton(
                            function: () => context.read<RoomBloc>().add(
                                ModifyRoomIndexEvent(
                                    roomLocation: RoomLocation.schoolSide)),
                            fontSize: 18.0.sp,
                            color: roomBlocState.value.roomLocation ==
                                    RoomLocation.schoolSide
                                ? LoturaColors.white
                                : LoturaColors.gray100,
                            fontColor: roomBlocState.value.roomLocation ==
                                    RoomLocation.schoolSide
                                ? LoturaColors.primary700
                                : LoturaColors.gray300,
                            text: "남자 학교측",
                            padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                            radius: 8.0,
                          ),
                          SizedBox(width: 8.0.w),
                          OSJTextButton(
                            function: () => context.read<RoomBloc>().add(
                                ModifyRoomIndexEvent(
                                    roomLocation: RoomLocation.dormitorySide)),
                            fontSize: 18.0.sp,
                            color: roomBlocState.value.roomLocation ==
                                    RoomLocation.dormitorySide
                                ? LoturaColors.white
                                : LoturaColors.gray100,
                            fontColor: roomBlocState.value.roomLocation ==
                                    RoomLocation.dormitorySide
                                ? LoturaColors.primary700
                                : LoturaColors.gray300,
                            text: "남자 기숙사측",
                            padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                            radius: 8.0,
                          ),
                        ],
                      ),
                    ),
                    LaundryRoomLayerFilter(
                        laundryRoomLayer: roomBlocState.value.laundryRoomLayer),
                    Expanded(
                      child:
                          BlocBuilder<LaundryBloc, LaundryState<LaundryModel>>(
                        builder: (context, state) {
                          return switch (state) {
                            Empty() => const Center(child: Text("비어있음")),
                            Loading() =>
                              const Center(child: CircularProgressIndicator()),
                            Error() =>
                              const Center(child: Text("인터넷 연결을 확인해주세요")),
                            Loaded() => LaundryList(
                                list: state.data.laundryList,
                                laundryRoomModel: roomBlocState.value,
                                nfcData: nfcTagData,
                              ),
                          };
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
        };
      },
    );
  }
}

class LaundryRoomLayerFilter extends StatelessWidget {
  const LaundryRoomLayerFilter({super.key, required this.laundryRoomLayer});

  final LaundryRoomLayer laundryRoomLayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => context.read<RoomBloc>().add(
              ModifyLaundryRoomLayerEvent(
                  laundryRoomLayer: LaundryRoomLayer.first)),
          child: Text(
            "1층",
            style: TextStyle(
              fontSize: 18.0.sp,
              color: laundryRoomLayer == LaundryRoomLayer.first
                  ? LoturaColors.black
                  : LoturaColors.gray300,
            ),
          ),
        ),
        TextButton(
          onPressed: () => context.read<RoomBloc>().add(
              ModifyLaundryRoomLayerEvent(
                  laundryRoomLayer: LaundryRoomLayer.second)),
          child: Text(
            "2층",
            style: TextStyle(
              fontSize: 18.0.sp,
              color: laundryRoomLayer == LaundryRoomLayer.second
                  ? LoturaColors.black
                  : LoturaColors.gray300,
            ),
          ),
        ),
      ],
    );
  }
}

class LaundryList extends StatelessWidget {
  LaundryList({
    super.key,
    required this.list,
    required this.laundryRoomModel,
    required this.nfcData,
  });

  final List<LaundryEntity> list;
  final LaundryRoomModel laundryRoomModel;
  final int nfcData;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31, 3: 47, 4: 63};

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (nfcData != -1 && laundryRoomModel.isNFCShowBottomSheet == false) {
          if (laundryRoomModel.showingBottomSheet == true) {
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
              deviceId: nfcData,
              isEnableNotification: true,
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
        itemCount: 8,
        // laundryRoomModel.roomLocation == RoomLocation.womanRoom ? 10 : 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MachineButton(
                    laundryEntity: laundryRoomModel.laundryRoomLayer ==
                            LaundryRoomLayer.first
                        ? list[
                            placeIndex[laundryRoomModel.roomLocation.index]! +
                                index]
                        : list[
                            placeIndex[laundryRoomModel.roomLocation.index]! +
                                index +
                                32],
                    isEnableNotification: true,
                  ),
                  const Icon(LoturaIcons.triangleUp, color: Colors.grey),
                  MachineButton(
                    laundryEntity: laundryRoomModel.laundryRoomLayer ==
                            LaundryRoomLayer.first
                        ? list[
                            placeIndex[laundryRoomModel.roomLocation.index]! +
                                index +
                                8]
                        : list[
                            placeIndex[laundryRoomModel.roomLocation.index]! +
                                index +
                                40],
                    isEnableNotification: true,
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
