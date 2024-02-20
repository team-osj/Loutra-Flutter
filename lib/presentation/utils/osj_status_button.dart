import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

class OSJStatusButton extends StatelessWidget {
  OSJStatusButton({
    super.key,
    required this.state,
  });

  final CurrentState state;

  final Map map = <CurrentState, String>{
    CurrentState.available: "사용 가능",
    CurrentState.working: "작동중",
    CurrentState.disconnected: "연결 끊김",
    CurrentState.breakdown: "고장",
  };

  final Map statusColor = <CurrentState, Color>{
    CurrentState.available: OSJColors.green100,
    CurrentState.working: OSJColors.primary100,
    CurrentState.disconnected: OSJColors.gray300,
    CurrentState.breakdown: OSJColors.red100,
  };

  final Map statusTextColor = <CurrentState, Color>{
    CurrentState.available: OSJColors.green700,
    CurrentState.working: OSJColors.primary700,
    CurrentState.disconnected: OSJColors.black,
    CurrentState.breakdown: OSJColors.red700,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: statusColor[state],
      ),
      child: Center(
        child: Text(
          map[state].toString(),
          style: TextStyle(
            color: statusTextColor[state],
            fontSize: 14.0.sp,
          ),
        ),
      ),
    );
  }
}
