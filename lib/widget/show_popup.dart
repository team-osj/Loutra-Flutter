import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/service/send_fcm_info.dart';

void showPopup(
    context, String deviceId, int alive, int state, String deviceType) {
  String type = deviceType == 'DRY' ? '건조기' : '세탁기';
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              //모서리 둥글게 깎기
              borderRadius: BorderRadius.circular(10.0)),
          title: state == 0
              ? alive == 1
                  ? Column(
                      children: [
                        Text('$deviceId번 $type 알림을',
                            style: TextStyle(fontSize: 22.0.sp)),
                        Text(
                          '받으시겠습니까?',
                          style: TextStyle(fontSize: 22.0.sp),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text('불편을 드려 죄송합니다.',
                            style: TextStyle(
                                fontSize: 22.0.sp,
                                fontWeight: FontWeight.bold)),
                        Text('현재 $deviceId번 $type를',
                            style: TextStyle(fontSize: 22.0.sp)),
                        Text('사용할 수 없습니다.',
                            style: TextStyle(fontSize: 22.0.sp)),
                      ],
                    )
              : Column(
                  children: [
                    Text('$type 사용할 수 있는 상태에요...!',
                        style: TextStyle(fontSize: 22.0.sp)),
                    Text(
                      '얼른 세탁실로 ㄱㄱ',
                      style: TextStyle(fontSize: 22.0.sp),
                    ),
                  ],
                ),
          actions: [
            alive == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(fontSize: 15.0.sp),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          sendFcmInfo(deviceId);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '확인',
                          style: TextStyle(fontSize: 15.0.sp),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '확인',
                        style: TextStyle(fontSize: 15.0.sp),
                      ),
                    ),
                  ),
          ],
        );
      } else {
        return CupertinoAlertDialog(
          title: state == 0
              ? alive == 1
                  ? Column(
                      children: [
                        Text('$deviceId번 $type 알림을',
                            style: TextStyle(fontSize: 20.0.sp)),
                        Text(
                          '받으시겠습니까?',
                          style: TextStyle(fontSize: 20.0.sp),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Text('불편을 드려 죄송합니다.',
                            style: TextStyle(fontSize: 20.0.sp)),
                        Text('현재 $deviceId번 $type를',
                            style: TextStyle(fontSize: 20.0.sp)),
                        Text('사용할 수 없습니다.',
                            style: TextStyle(fontSize: 20.0.sp)),
                      ],
                    )
              : Column(
                  children: [
                    Text('$type를 사용할 수 있는 상태에요...!',
                        style: TextStyle(fontSize: 22.0.sp)),
                    Text(
                      '얼른 세탁실로 ㄱㄱ',
                      style: TextStyle(fontSize: 22.0.sp),
                    ),
                  ],
                ),
          actions: [
            state == 0
                ? alive == 1
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              '취소',
                              style: TextStyle(fontSize: 15.0.sp),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              sendFcmInfo(deviceId);
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              '확인',
                              style: TextStyle(fontSize: 15.0.sp),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '확인',
                            style: TextStyle(fontSize: 15.0.sp),
                          ),
                        ),
                      )
                : Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        '확인',
                        style: TextStyle(fontSize: 15.0.sp),
                      ),
                    ),
                  ),
          ],
        );
      }
    },
  );
}
