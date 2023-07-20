import 'package:flutter/material.dart';
import 'package:lotura/Widget/custom_icons.dart';
import 'package:lotura/widget/machine_button.dart';
import 'package:lotura/main.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    super.key,
    required this.leftIndex,
    required this.rightIndex,
    required this.leftStatus,
    required this.rightStatus,
    required this.leftMachine,
    required this.rightMachine,
  });

  final int leftIndex, rightIndex;
  final Status leftStatus, rightStatus;
  final Machine leftMachine, rightMachine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MachineButton(
            index: leftIndex, status: leftStatus, machine: leftMachine),
        const Icon(CustomIcons.triangleUp, color: Colors.grey),
        MachineButton(
          index: rightIndex,
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
