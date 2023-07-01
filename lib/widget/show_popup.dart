import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/Widget/custom_colors.dart';
import 'package:lotura/service/send_fcm_info.dart';

void showPopup(
    context, String deviceId, int alive, int state, String deviceType) {
  String type = deviceType == 'DRY' ? '건조기' : '세탁기';
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        return androidDialog(state, alive, deviceId, type, context);
      } else {
        return iOSDialog(state, alive, deviceId, type, context);
      }
    },
  );
}

List<Widget> apply(BuildContext context, String deviceId) {
  List<Widget> list = List.empty(growable: true);
  list.add(
    CupertinoDialogAction(
      child: Text(
        "Cancel",
        style: TextStyle(fontSize: 16.0.sp, color: customRed),
      ),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
  list.add(
    CupertinoDialogAction(
      child: Text(
        "OK",
        style: TextStyle(fontSize: 16.0.sp),
      ),
      onPressed: () {
        sendFcmInfo(deviceId);
        Navigator.of(context).pop();
      },
    ),
  );
  return list;
}

AlertDialog androidDialog(
    int state, alive, String deviceId, type, BuildContext context) {
  return AlertDialog(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
        //모서리 둥글게 깎기
        borderRadius: BorderRadius.circular(10.0)),
    title: alive == 1
        ? state == 0
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
                  Text('$type를 사용할 수 있는', style: TextStyle(fontSize: 22.0.sp)),
                  Text(
                    '상태입니다.',
                    style: TextStyle(fontSize: 22.0.sp),
                  ),
                ],
              )
        : Column(
            children: [
              Text('불편을 드려 죄송합니다.',
                  style: TextStyle(
                      fontSize: 22.0.sp, fontWeight: FontWeight.bold)),
              Text('현재 $deviceId번 $type를', style: TextStyle(fontSize: 22.0.sp)),
              Text('사용할 수 없습니다.', style: TextStyle(fontSize: 22.0.sp)),
            ],
          ),
    actions: [
      alive == 1
          ? state == 0
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

CupertinoAlertDialog iOSDialog(
    int state, alive, String deviceId, type, BuildContext context) {
  return CupertinoAlertDialog(
    title: alive == 1
        ? state == 0
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
                  Text('$type를 사용할 수 있는', style: TextStyle(fontSize: 20.0.sp)),
                  Text(
                    '상태입니다.',
                    style: TextStyle(fontSize: 20.0.sp),
                  ),
                ],
              )
        : Column(
            children: [
              Text('불편을 드려 죄송합니다.', style: TextStyle(fontSize: 20.0.sp)),
              Text('현재 $deviceId번 $type를', style: TextStyle(fontSize: 20.0.sp)),
              Text('사용할 수 없습니다.', style: TextStyle(fontSize: 20.0.sp)),
            ],
          ),
    actions: state == 0 && alive == 1
        ? apply(context, deviceId)
        : [
            CupertinoDialogAction(
              child: Text(
                'OK',
                style: TextStyle(fontSize: 18.0.sp),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
  );
}
