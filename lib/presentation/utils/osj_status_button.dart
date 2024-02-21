import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class OSJStatusButton extends StatelessWidget {
  OSJStatusButton({
    super.key,
    required this.state,
  });

  final CurrentState state;

  final Map<CurrentState, Color> stateColor = {
    CurrentState.available: LoturaColors.green100,
    CurrentState.working: LoturaColors.primary100,
    CurrentState.disconnected: LoturaColors.gray300,
    CurrentState.breakdown: LoturaColors.red100,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.w,
      height: 32.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: stateColor[state],
      ),
      child: Center(
        child: Text(
          state.text,
          style: TextStyle(
            color: state.deepColor,
            fontSize: 14.0.sp,
          ),
        ),
      ),
    );
  }
}
