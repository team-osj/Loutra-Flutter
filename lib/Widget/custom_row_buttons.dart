import 'package:flutter/material.dart';
import 'package:osj_flutter/Widget/custom_icons.dart';
import 'package:osj_flutter/Widget/show_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/View/icon_func.dart';
import 'package:osj_flutter/View/color_func.dart';

customRowButtons(BuildContext context, String a, String aDeviceType, int aState,
    int aAlive, String b, String bDeviceType, int bState, int bAlive) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          showPopup(context, a);
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
                style: TextStyle(
                    fontSize: 20.0.sp,
                    fontFamily: 'NanumGothicCoding',
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  showPopup(context, a);
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
          showPopup(context, b);
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
                      style: TextStyle(
                          fontSize: 20.0.sp,
                          fontFamily: 'NanumGothicCoding',
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        showPopup(context, b);
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
