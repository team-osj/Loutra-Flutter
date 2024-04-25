import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class OSJStatusButton extends StatelessWidget {
  const OSJStatusButton({
    super.key,
    required this.state,
    this.emptyStatus = false,
  });

  final bool emptyStatus;
  final CurrentState state;

  final Map<CurrentState, Color> stateColor = const {
    CurrentState.available: LoturaColors.green100,
    CurrentState.working: LoturaColors.primary100,
    CurrentState.disconnected: LoturaColors.gray300,
    CurrentState.breakdown: LoturaColors.red100,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0.r),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0.r),
        color: emptyStatus ? Colors.transparent : stateColor[state],
      ),
      child: Text(
        state.text,
        textAlign: TextAlign.center,
        textScaler: TextScaler.noScaling,
        style: TextStyle(
          color: emptyStatus ? Colors.transparent : state.deepColor,
          fontSize: 20.0.sp,
        ),
      ),
    );
  }
}
