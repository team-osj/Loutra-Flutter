import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/laundry/entity/laundry_entity.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/lotura_icons.dart';
import 'package:lotura/presentation/utils/machine_widget.dart';

class MachineButton extends MachineWidget {
  MachineButton({
    super.key,
    required this.laundryEntity,
    required super.isEnableNotification,
  }) : super(
          deviceId: laundryEntity.id,
          deviceType: laundryEntity.deviceType,
          state: laundryEntity.state,
        );

  final LaundryEntity laundryEntity;

  @override
  Widget build(BuildContext context) {
    return laundryEntity.deviceType.isEmpty
        ? Container(
            padding: EdgeInsets.all(12.0.r),
            constraints: BoxConstraints(
              minWidth: 150.0.w,
              maxWidth: 185.0.w,
            ),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(color: Colors.transparent)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 32.0.r,
                  height: 32.0.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
                  child: Icon(LoturaIcons.dry,
                      size: 20.0.r, color: Colors.transparent),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("12번",
                        style: TextStyle(
                            fontSize: 16.0.sp, color: Colors.transparent)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("세탁기",
                            style: TextStyle(
                                fontSize: 15.0.sp, color: Colors.transparent)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : GestureDetector(
            onTap: () => showModalOSJBottomSheet(context: context),
            child: Container(
              padding: EdgeInsets.all(12.0.r),
              constraints: BoxConstraints(
                minWidth: 150.0.w,
                maxWidth: 185.0.w,
              ),
              decoration: BoxDecoration(
                  color: laundryEntity.state.color,
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: LoturaColors.gray200)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32.0.r,
                    height: 32.0.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: laundryEntity.state.color,
                      border: Border.all(
                          color: laundryEntity.state.deviceIconColor, width: 2),
                    ),
                    child: Icon(laundryEntity.deviceType.icon,
                        size: 20.0.r,
                        color: laundryEntity.state.deviceIconColor),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("${laundryEntity.id}번",
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w500)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(laundryEntity.deviceType.text,
                              style: TextStyle(fontSize: 14.0.sp)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
