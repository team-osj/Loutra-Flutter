import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/osj_bottom_sheet.dart';

abstract class MachineWidget extends StatelessWidget {
  const MachineWidget({
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

  bool get isEmptyContainer =>
      (!isWoman && index == 32) || (isWoman && index == -1);

  void showModalOSJBottomSheet({required BuildContext context}) =>
      showModalBottomSheet(
        context: context,
        enableDrag: false,
        isDismissible: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        builder: (context) => OSJBottomSheet(
          index: index,
          isEnableNotification: isEnableNotification,
          isWoman: isWoman,
          state: state,
          machine: machine,
        ),
      );
}
