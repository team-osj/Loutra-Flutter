import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as m;
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/osj_bottom_sheet.dart';

abstract class MachineWidget extends StatelessWidget {
  const MachineWidget({
    super.key,
    required this.deviceId,
    required this.isEnableNotification,
    required this.state,
    required this.deviceType,
  });

  final int deviceId;
  final DeviceType deviceType;
  final CurrentState state;
  final bool isEnableNotification;

  void showModalOSJBottomSheet({required BuildContext context}) =>
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.r),
          ),
        ),
        builder: (context) => OSJBottomSheet(
          deviceId: deviceId,
          isEnableNotification: isEnableNotification,
          state: state,
          machine: deviceType,
        ),
      );
}
