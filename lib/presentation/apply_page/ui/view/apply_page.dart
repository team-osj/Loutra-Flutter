import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/apply_entity.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_state.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_bloc.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_event.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_model.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_state.dart' as n;
import 'package:lotura/presentation/notice_page/ui/view/notice_page.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_card.dart';

class ApplyPage extends StatelessWidget {
  ApplyPage({super.key});

  final TextStyle bigStyle = TextStyle(
    fontSize: 40.0.sp,
    color: LoturaColors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle smallStyle = TextStyle(
    fontSize: 16.0.sp,
    color: LoturaColors.gray500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: 200.0.w,
        leading: Row(
          children: [
            SizedBox(width: 24.0.w),
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
        actions: [
          IconButton(
            onPressed: () {
              context.read<NoticeBloc>().add(UpdateLastNoticeIdEvent());
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NoticePage()));
            },
            icon: BlocBuilder<NoticeBloc, n.NoticeState<NoticeModel>>(
              builder: (context, state) => Icon(
                state.value.isNewNotice ? LoturaIcons.notice : Icons.ac_unit,
                size: 24.0.r,
                color: LoturaColors.black,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("알림 설정한", style: bigStyle),
                Text("세탁기와 건조기", style: bigStyle),
                SizedBox(height: 24.0.h),
                Text("알림을 설정하여 세탁기와 건조기를", style: smallStyle),
                SizedBox(height: 5.0.h),
                Text("누구보다 빠르게 사용해보세요.", style: smallStyle),
              ],
            ),
            SizedBox(height: 20.0.h),
            Expanded(
              child: BlocBuilder<ApplyBloc, ApplyState<List<ApplyEntity>>>(
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
                          itemCount: state.value.length.isEven
                              ? state.value.length ~/ 2
                              : state.value.length ~/ 2 + 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MachineCard(
                                        index: state.value[index * 2].deviceId,
                                        isEnableNotification: false,
                                        isWoman:
                                            state.value[index * 2].deviceId > 31
                                                ? true
                                                : false,
                                        machine: state.value[index * 2].machine,
                                        state: CurrentState.working),
                                    index * 2 + 1 < state.value.length
                                        ? MachineCard(
                                            index: state
                                                .value[index * 2 + 1].deviceId,
                                            isEnableNotification: false,
                                            isWoman: state.value[index * 2 + 1]
                                                        .deviceId >
                                                    31
                                                ? true
                                                : false,
                                            machine: state
                                                .value[index * 2 + 1].machine,
                                            state: CurrentState.working)
                                        : SizedBox(
                                            width: 185.0.w,
                                            height: 256.0.h,
                                          ),
                                  ],
                                ),
                                SizedBox(height: 10.0.h),
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
