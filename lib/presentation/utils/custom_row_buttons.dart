import 'package:flutter/material.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_button.dart';
import 'package:lotura/presentation/utils/machine_card.dart';

class CustomRowButton extends StatelessWidget {
  const CustomRowButton({
    super.key,
    required this.isSelectedIcon,
    required this.isWoman,
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
  final bool isWoman;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isSelectedIcon == 0
            ? MachineCard(
                index: leftIndex,
                isWoman: isWoman,
                isEnableNotification: true,
                machine: leftMachine,
                status: leftStatus,
              )
            : MachineButton(
                index: leftIndex,
                isWoman: isWoman,
                isEnableNotification: true,
                status: leftStatus,
                machine: leftMachine),
        isSelectedIcon == 0
            ? const SizedBox.shrink()
            : const Icon(LoturaIcons.triangleUp, color: Colors.grey),
        isSelectedIcon == 0
            ? MachineCard(
                index: rightIndex,
                isWoman: isWoman,
                isEnableNotification: true,
                machine: rightMachine,
                status: rightStatus,
              )
            : MachineButton(
                index: rightIndex,
                isWoman: isWoman,
                isEnableNotification: true,
                status: rightStatus,
                machine: rightMachine,
              ),
      ],
    );
  }
}
