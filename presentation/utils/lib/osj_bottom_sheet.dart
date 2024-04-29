import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:apply_presentation/bloc/apply_event.dart';
import 'package:core/current_state.dart';
import 'package:core/device_type.dart';
import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;
import 'package:utils/osj_text_button.dart';

class OSJBottomSheet extends StatefulWidget {
  const OSJBottomSheet({
    super.key,
    required this.deviceId,
    required this.isEnableNotification,
    required this.isWoman,
    required this.state,
    required this.machine,
  });

  final int deviceId;
  final bool isEnableNotification, isWoman;
  final CurrentState state;
  final DeviceType machine;

  @override
  State<OSJBottomSheet> createState() => _OSJBottomSheetState();
}

class _OSJBottomSheetState extends State<OSJBottomSheet> {
  String text(bool isEnableNotification, isWoman, CurrentState state) {
    if (isEnableNotification) {
      if (isWoman) {
        switch (state) {
          case CurrentState.working:
            return "여자 세탁실 ${widget.deviceId - 31}번 ${widget.machine.text}를\n알림 설정 하실건가요?";
          case CurrentState.available:
            return "여자 세탁실 ${widget.deviceId - 31}번 ${widget.machine.text}는\n현재 사용 가능한 상태에요.";
          case CurrentState.disconnected:
            return "여자층 ${widget.deviceId - 31}번 ${widget.machine.text}의 연결이 끊겨서\n상태를 확인할 수 없어요.";
          case CurrentState.breakdown:
            return "여자 세탁실 ${widget.deviceId - 31}번 ${widget.machine.text}는\n고장으로 인해 사용이 불가능해요.";
        }
      } else {
        switch (state) {
          case CurrentState.working:
            return "${widget.deviceId}번 ${widget.machine.text}를\n알림 설정 하실건가요?";
          case CurrentState.available:
            return "${widget.deviceId}번 ${widget.machine.text}는\n현재 사용 가능한 상태에요.";
          case CurrentState.disconnected:
            return "${widget.deviceId}번 ${widget.machine.text}의 연결이 끊겨서\n상태를 확인할 수 없어요.";
          case CurrentState.breakdown:
            return "${widget.deviceId}번 ${widget.machine.text}는\n고장으로 인해 사용이 불가능해요.";
        }
      }
    } else {
      if (isWoman) {
        return "여자 세탁실 ${widget.deviceId - 31}번 ${widget.machine.text}의\n알림 설정을 해제하실건가요?";
      } else {
        return "${widget.deviceId}번 ${widget.machine.text}의\n알림 설정을 해제하실건가요?";
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0.r, horizontal: 24.0.r),
      decoration: const BoxDecoration(
        color: LoturaColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24.0.r),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.state != CurrentState.working)
                    Icon(
                      widget.state.icon,
                      size: 24.0.r,
                      color: widget.state == CurrentState.available
                          ? LoturaColors.green700
                          : widget.state == CurrentState.disconnected
                              ? LoturaColors.black
                              : LoturaColors.red700,
                    ),
                  SizedBox(height: 10.0.r),
                  Text(
                    text(widget.isEnableNotification, widget.isWoman,
                        widget.state),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget.state == CurrentState.working
              ? Row(
                  children: [
                    Expanded(
                      child: OSJTextButton(
                          function: () {
                            Navigator.of(context).pop();
                          },
                          fontSize: 14.0.sp,
                          color: LoturaColors.gray100,
                          fontColor: LoturaColors.black,
                          padding: EdgeInsets.symmetric(vertical: 15.0.r),
                          text: "취소"),
                    ),
                    SizedBox(width: 16.0.r),
                    Expanded(
                      child: OSJTextButton(
                          function: () {
                            widget.isEnableNotification
                                ? context.read<ApplyBloc>().add(SendFCMEvent(
                                    deviceId: widget.deviceId,
                                    deviceType: widget.machine))
                                : context
                                    .read<ApplyBloc>()
                                    .add(ApplyCancelEvent(
                                      deviceId: widget.deviceId,
                                    ));
                            Navigator.pop(context);
                          },
                          fontSize: 14.0.sp,
                          color: LoturaColors.primary700,
                          fontColor: LoturaColors.white,
                          padding: EdgeInsets.symmetric(vertical: 15.0.r),
                          text:
                              widget.isEnableNotification ? "알림 설정" : "알림 해제"),
                    ),
                  ],
                )
              : OSJTextButton(
                  function: () {
                    Navigator.of(context).pop();
                  },
                  fontSize: 16.0.sp,
                  color: LoturaColors.gray100,
                  fontColor: LoturaColors.black,
                  padding: EdgeInsets.symmetric(vertical: 15.0.r),
                  text: "확인"),
        ],
      ),
    );
  }
}
