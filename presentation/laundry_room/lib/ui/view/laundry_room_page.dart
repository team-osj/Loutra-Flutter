import 'package:core/button_view.dart';
import 'package:core/current_state.dart';
import 'package:core/device_type.dart';
import 'package:core/lotura_colors.dart';
import 'package:core/lotura_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;
import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_room_presentation/bloc/laundry_bloc.dart';
import 'package:laundry_room_presentation/bloc/laundry_model.dart';
import 'package:laundry_room_presentation/bloc/laundry_state.dart';
import 'package:notice_presentation/bloc/notice_bloc.dart';
import 'package:notice_presentation/bloc/notice_event.dart';
import 'package:notice_presentation/ui/view/notice_page.dart';
import 'package:utils/machine_button.dart';
import 'package:utils/machine_widget.dart';
import 'package:utils/osj_text_button.dart';

class LaundryRoomPage extends StatelessWidget {
  LaundryRoomPage({super.key});

  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
          padding: EdgeInsets.only(left: 10.r),
          child: Text(
            "남자 학교측",
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
            },
            icon: Icon(
              LoturaIcons.notice,
              color: LoturaColors.black,
              size: 24.0.r,
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
                    fontSize: 18.0.sp,
                    color: LoturaColors.white,
                    fontColor: LoturaColors.primary700,
                    text: "남자 학교측",
                    padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    fontSize: 18.0.sp,
                    color: LoturaColors.gray100,
                    fontColor: LoturaColors.gray300,
                    text: "남자 기숙사측",
                    padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    fontSize: 18.0.sp,
                    color: LoturaColors.gray100,
                    fontColor: LoturaColors.gray300,
                    text: "여자",
                    padding: EdgeInsets.symmetric(horizontal: 5.0.r),
                    radius: 8.0,
                  ),
                ],
              ),
            ),
            const ViewTypeFilter(buttonView: ButtonView.icon),
            Expanded(
              child: BlocBuilder<LaundryBloc, LaundryState<LaundryModel>>(
                builder: (context, state) {
                  return switch (state) {
                    Empty() => const Center(child: Text("비어있음")),
                    Loading() =>
                      const Center(child: CircularProgressIndicator()),
                    Error() => const Center(child: Text("인터넷 연결을 확인해주세요")),
                    Loaded() => LaundryList(
                        list: state.data.laundryList,
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewTypeFilter extends StatelessWidget {
  const ViewTypeFilter({super.key, required this.buttonView});

  final ButtonView buttonView;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(LoturaIcons.grid,
              size: 18.0.r,
              color: buttonView == ButtonView.image
                  ? LoturaColors.black
                  : LoturaColors.gray300),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            LoturaIcons.list,
            size: 18.0.r,
            color: buttonView == ButtonView.icon
                ? LoturaColors.black
                : LoturaColors.gray300,
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
  });

  final List<LaundryEntity> list;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  MachineWidget machineWidget(
          {required int deviceId,
          required CurrentState state,
          required DeviceType deviceType}) =>
      MachineButton(
          deviceId: deviceId,
          isEnableNotification: true,
          isWoman: false,
          state: state,
          deviceType: deviceType);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  machineWidget(
                      deviceId: list[index].id,
                      deviceType: list[index].deviceType,
                      state: list[index].state),
                  machineWidget(
                      deviceId: list[index + 8].id,
                      deviceType: list[index + 8].deviceType,
                      state: list[index + 8].state),
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
