import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;
import 'package:lotura/main.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_model.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_state.dart';
import 'package:lotura/presentation/apply_page/ui/widget/machine_card.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_bloc.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_event.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_model.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_state.dart' as n;
import 'package:lotura/presentation/notice_page/ui/view/notice_page.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';

class ApplyPage extends StatelessWidget {
  ApplyPage({super.key});

  final TextStyle bigStyle = TextStyle(
    fontSize: 32.0.sp,
    color: LoturaColors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle smallStyle = TextStyle(
    fontSize: 18.0.sp,
    color: LoturaColors.gray500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
          padding: EdgeInsets.only(left: 10.0.r),
          child: Row(
            children: [
              Image.asset(
                "assets/applogo.jpeg",
                width: 24.0.w,
                height: 24.0.h,
              ),
              SizedBox(width: 8.0.w),
              Text(
                "OSJ",
                style: TextStyle(
                    fontSize: 20.0.sp,
                    color: LoturaColors.primary700,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoticeBloc>().add(UpdateLastNoticeIdEvent());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingPage())),
              icon: Icon(
                Icons.settings,
                color: LoturaColors.black,
                size: 28.0.r,
              )),
          SizedBox(width: 24.0.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 36.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("알림 설정한\n세탁기와 건조기", style: bigStyle),
                  SizedBox(height: 24.0.h),
                  Text("알림을 설정하여 세탁기와 건조기를\n누구보다 빠르게 사용해보세요.",
                      style: smallStyle),
                ],
              ),
            ),
            SizedBox(height: 20.0.h),
            Expanded(
              child: BlocBuilder<ApplyBloc, ApplyState<ApplyModel>>(
                builder: (context, state) {
                  return switch (state) {
                    Empty() => const Center(child: Text("비어있음")),
                    Loading() =>
                      const Center(child: CircularProgressIndicator()),
                    Error() => const Center(child: Text("인터넷 연결을 확인해주세요")),
                    Loaded() => ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView.builder(
                          itemCount: state.value.applyList.length.isEven
                              ? state.value.applyList.length ~/ 2
                              : state.value.applyList.length ~/ 2 + 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    MachineCard(
                                        deviceId: state.value
                                            .applyList[index * 2].deviceId,
                                        isEnableNotification: false,
                                        deviceType: state.value
                                            .applyList[index * 2].deviceType,
                                        state: CurrentState.working),
                                    index * 2 + 1 < state.value.applyList.length
                                        ? MachineCard(
                                            deviceId: state
                                                .value
                                                .applyList[index * 2 + 1]
                                                .deviceId,
                                            isEnableNotification: false,
                                            deviceType: state
                                                .value
                                                .applyList[index * 2 + 1]
                                                .deviceType,
                                            state: CurrentState.working)
                                        : const MachineCard(
                                            //리팩토링 꼭 하기
                                            deviceId: -1,
                                            isEnableNotification: false,
                                            deviceType: DeviceType.empty,
                                            state: CurrentState.working)
                                  ],
                                ),
                                SizedBox(height: 20.0.r),
                              ],
                            );
                          },
                        ),
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
