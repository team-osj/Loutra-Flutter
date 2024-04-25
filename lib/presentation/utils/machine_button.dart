import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';

class MachineButton extends MachineWidget {
  const MachineButton({
    super.key,
    required super.deviceId,
    required super.isEnableNotification,
    required super.isWoman,
    required super.state,
    required super.deviceType,
  });

  @override
  Widget build(BuildContext context) {
    return isEmptyContainer
        ? Container(
            constraints: BoxConstraints(
              maxWidth: 180.0.r,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 32.0.r,
                        height: 32.0.r,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border:
                              Border.all(color: Colors.transparent, width: 2),
                        ),
                        child: Icon(Icons.ac_unit,
                            size: 20.0.r, color: Colors.transparent),
                      ),
                      Text("12번",
                          style: TextStyle(
                              fontSize: 16.0.sp, color: Colors.transparent)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("세탁기",
                          style: TextStyle(
                              fontSize: 15.0.sp, color: Colors.transparent)),
                      SizedBox(width: 5.0.r),
                      Icon(
                        Icons.abc,
                        size: 20.0.r,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () => showModalOSJBottomSheet(context: context),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 180.0.r,
              ),
              decoration: BoxDecoration(
                  color: state.color,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: LoturaColors.gray200)),
              child: Padding(
                padding: EdgeInsets.all(12.0.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 32.0.r,
                          height: 32.0.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.color,
                            border: Border.all(
                                color: state.deviceIconColor, width: 2),
                          ),
                          child: Icon(deviceType.icon,
                              size: 20.0.r, color: state.deviceIconColor),
                        ),
                        Text("${isWoman ? deviceId - 31 : deviceId}번",
                            style: TextStyle(fontSize: 16.0.sp)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(deviceType.text,
                            style: TextStyle(fontSize: 15.0.sp)),
                        SizedBox(width: 5.0.r),
                        Icon(
                          state.icon,
                          size: 20.0.r,
                          color: state.deepColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
