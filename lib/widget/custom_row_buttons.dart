import 'package:flutter/material.dart';
import 'package:lotura/Widget/custom_icons.dart';
import 'package:lotura/Widget/show_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/icon_func.dart';
import 'package:lotura/widget/color_func.dart';

customRowButtons(BuildContext context, String a, String aDeviceType, int aState,
    int aAlive, String b, String bDeviceType, int bState, int bAlive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          showPopup(context, a, aAlive, aState, a);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0)),
          width: 110.0.w,
          height: 60.0.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                a.toString(),
                style: TextStyle(fontSize: 20.0.sp, fontFamily: 'Inter'),
              ),
              IconButton(
                onPressed: () {
                  showPopup(context, a, aAlive, aState, aDeviceType);
                },
                icon: iconFunc(aDeviceType, aAlive),
                iconSize: 40.0.r,
                color: colorFunc(aState, aAlive),
              ),
            ],
          ),
        ),
      ),
      const Icon(CustomIcons.triangleUp, color: Colors.grey),
      GestureDetector(
        onTap: () {
          showPopup(context, b, bAlive, bState, bDeviceType);
        },
        child: b == 'null'
            ? SizedBox(
                width: 110.0.w,
                height: 60.0.h,
              )
            : Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                width: 110.0.w,
                height: 60.0.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      b.toString(),
                      style: TextStyle(fontSize: 20.0.sp, fontFamily: 'Inter'),
                    ),
                    IconButton(
                      onPressed: () {
                        showPopup(context, b, bAlive, bState, bDeviceType);
                      },
                      icon: iconFunc(bDeviceType, bAlive),
                      iconSize: 40.0.r,
                      color: colorFunc(bState, bAlive),
                    ),
                  ],
                ),
              ),
      ),
    ],
  );
}
