import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget myPageButton(String title) {
  return SizedBox(
    width: 90.0.w,
    height: 40.0.h,
    child: MaterialButton(
      onPressed: () {
      },
      color: Colors.white,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: Colors.blueAccent[400],
              fontSize: 20.0.sp,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}

Widget myPageButtonToLink(String title, String link) {
  return SizedBox(
    width: 90.0.w,
    height: 40.0.h,
    child: MaterialButton(
      onPressed: () {
        WebView(
          initialUrl: link,
          javascriptMode: JavascriptMode.unrestricted,
        );
      },
      color: Colors.white,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: Colors.blueAccent[400],
              fontSize: 20.0.sp,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.grey,
          ),
        ],
      ),
    ),
  );
}
