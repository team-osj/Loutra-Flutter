import 'package:flutter/material.dart';
import 'package:lotura/widget/machine_button.dart';
import 'package:lotura/main.dart';
import 'package:lotura/widget/machine_card.dart';
import 'package:lotura/widget/osj_icons.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    super.key,
    required this.isSelectedIcon,
    required this.leftIndex,
    required this.rightIndex,
    required this.leftStatus,
    required this.rightStatus,
    required this.leftMachine,
    required this.rightMachine,
  });

  final int leftIndex, rightIndex, isSelectedIcon;
  final Status leftStatus, rightStatus;
  final Machine leftMachine, rightMachine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isSelectedIcon == 0
            ? MachineCard(
                index: leftIndex,
                isEnableNotification: true,
                machine: leftMachine,
                status: leftStatus,
              )
            : MachineButton(
                index: leftIndex,
                isEnableNotification: true,
                status: leftStatus,
                machine: leftMachine),
        isSelectedIcon == 0
            ? const SizedBox.shrink()
            : const Icon(OSJIcons.triangleUp, color: Colors.grey),
        isSelectedIcon == 0
            ? MachineCard(
                index: rightIndex,
                isEnableNotification: true,
                machine: rightMachine,
                status: rightStatus,
              )
            : MachineButton(
                index: rightIndex,
                isEnableNotification: true,
                status: rightStatus,
                machine: rightMachine,
              ),
      ],
    );
  }
}

//customRowButtons(
//         BuildContext context,
//         String aIndex,
//         String aDeviceType,
//         int aState,
//         int aAlive,
//         String bIndex,
//         String bDeviceType,
//         int bState,
//         int bAlive) =>
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         MachineButton(
//             index: 10,
//             status: Status.breakdown,
//             machine: Machine.laundryMachine),
//         const Icon(CustomIcons.triangleUp, color: Colors.grey),
//         MachineButton(
//             index: 9, status: Status.working, machine: Machine.dryMachine),
//       ],
//     );
