import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/request/apply_cancel_request.dart';
import 'package:lotura/data/dto/request/send_fcm_info_request.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
import 'package:lotura/presentation/utils/osj_text_button.dart';

class OSJBottomSheet extends StatelessWidget {
  OSJBottomSheet({
    super.key,
    required this.index,
    required this.isEnableNotification,
    required this.isWoman,
    required this.state,
    required this.machine,
  });

  final int index;
  final bool isEnableNotification, isWoman;
  final CurrentState state;
  final Machine machine;

  final Map statusColor = <CurrentState, Color>{
    CurrentState.available: OSJColors.green50,
    CurrentState.working: OSJColors.primary50,
    CurrentState.disconnected: OSJColors.black,
    CurrentState.breakdown: OSJColors.red50,
  };

  final Map statusIcon = <CurrentState, IconData>{
    CurrentState.available: LoturaIcons.checkCircle,
    CurrentState.working: LoturaIcons.working,
    CurrentState.disconnected: LoturaIcons.disconnected,
    CurrentState.breakdown: LoturaIcons.cancelCircle,
  };

  final Map machineIcon = <Machine, IconData>{
    Machine.wash: LoturaIcons.laundry,
    Machine.dry: LoturaIcons.dry,
  };

  final Map machineText = <Machine, String>{
    Machine.wash: "세탁기",
    Machine.dry: "건조기",
  };

  String text(bool isEnableNotification, isWoman, CurrentState state) {
    if (isEnableNotification) {
      if (isWoman) {
        switch (state) {
          case CurrentState.working:
            return "여자 세탁실 ${index - 31}번 ${machineText[machine]}를\n알림 설정 하실건가요?";
          case CurrentState.available:
            return "여자 세탁실 ${index - 31}번 ${machineText[machine]}는\n현재 사용 가능한 상태에요.";
          case CurrentState.disconnected:
            return "여자층 ${index - 31}번 ${machineText[machine]}의 연결이 끊겨서\n상태를 확인할 수 없어요.";
          case CurrentState.breakdown:
            return "여자 세탁실 ${index - 31}번 ${machineText[machine]}는\n고장으로 인해 사용이 불가능해요.";
        }
      } else {
        switch (state) {
          case CurrentState.working:
            return "$index번 ${machineText[machine]}를\n알림 설정 하실건가요?";
          case CurrentState.available:
            return "$index번 ${machineText[machine]}는\n현재 사용 가능한 상태에요.";
          case CurrentState.disconnected:
            return "$index번 ${machineText[machine]}의 연결이 끊겨서\n상태를 확인할 수 없어요.";
          case CurrentState.breakdown:
            return "$index번 ${machineText[machine]}는\n고장으로 인해 사용이 불가능해요.";
        }
      }
    } else {
      if (isWoman) {
        return "여자 세탁실 ${index - 31}번 ${machineText[machine]}의\n알림 설정을 해제하실건가요?";
      } else {
        return "$index번 ${machineText[machine]}의\n알림 설정을 해제하실건가요?";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: state == CurrentState.working ? 220.0.h : 268.0.h,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 32.0.h,
          bottom: 12.0.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state == CurrentState.working
                ? const SizedBox.shrink()
                : Icon(
                    statusIcon[state],
                    size: 24.0.r,
                    color: state == CurrentState.available
                        ? OSJColors.green700
                        : state == CurrentState.disconnected
                            ? OSJColors.black
                            : OSJColors.red700,
                  ),
            Padding(
              padding: state == CurrentState.working
                  ? EdgeInsets.only(bottom: 24.0.h)
                  : EdgeInsets.only(top: 24.0.h, bottom: 24.0.h),
              child: Text(
                text(isEnableNotification, isWoman, state),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            state == CurrentState.working
                ? Row(
                    children: [
                      OSJTextButton(
                          function: () => Navigator.of(context).pop(),
                          width: 185.0.w,
                          height: 56.0.h,
                          fontSize: 16.0.sp,
                          color: OSJColors.gray100,
                          fontColor: OSJColors.black,
                          text: "취소"),
                      SizedBox(width: 12.0.w),
                      OSJTextButton(
                          function: () {
                            isEnableNotification
                                ? context.read<ApplyBloc>().add(SendFCMEvent(
                                    sendFCMInfoRequest: SendFCMInfoRequest(
                                        deviceId: index.toString(),
                                        expectState: '1')))
                                : context.read<ApplyBloc>().add(
                                    ApplyCancelEvent(
                                        applyCancelRequest: ApplyCancelRequest(
                                            deviceId: index.toString())));
                            Navigator.pop(context);
                          },
                          width: 185.0.w,
                          height: 56.0.h,
                          fontSize: 16.0.sp,
                          color: OSJColors.primary700,
                          fontColor: OSJColors.white,
                          text: isEnableNotification ? "알림 설정" : "알림 해제"),
                    ],
                  )
                : Center(
                    child: OSJTextButton(
                        function: () => Navigator.of(context).pop(),
                        width: 382.0.w,
                        height: 56.0.h,
                        fontSize: 16.0.sp,
                        color: OSJColors.gray100,
                        fontColor: OSJColors.black,
                        text: "확인"),
                  ),
          ],
        ),
      ),
    );
  }
}
