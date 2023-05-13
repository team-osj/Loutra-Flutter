import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lotura/model/apply_list.dart';
import 'package:lotura/service/apply_cancle.dart';
import 'package:lotura/service/receive_apply_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/remove_popup.dart';

class StreamDrawer extends StatefulWidget {
  const StreamDrawer({Key? key}) : super(key: key);

  @override
  State<StreamDrawer> createState() => _StreamDrawerState();
}

class _StreamDrawerState extends State<StreamDrawer> {
  late StreamController<ApplyList> controller;

  @override
  void initState() {
    super.initState();
    controller = StreamController<ApplyList>();
    receiveApplyList(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 120.0.h,
            child: DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Center(
                child: Text(
                  "신청 리스트",
                  style: TextStyle(fontSize: 24.0.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.77,
            child: StreamBuilder<ApplyList>(
              stream: controller.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 20.0.w),
                      itemCount: snapshot.data!.applyList!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.asset(
                            "assets/applogo.jpg",
                            width: 30.0.r,
                          ),
                          title: Text(
                            "${snapshot.data!.applyList![index].deviceId}번 ${snapshot.data!.applyList![index].deviceType == "WASH" ? "세탁기" : "건조기"} 작동 중",
                            style: TextStyle(fontSize: 17.0.sp),
                          ),
                          trailing: IconButton(
                              onPressed: () => removePopup(
                                  controller,
                                  context,
                                  snapshot.data!.applyList![index].deviceId,
                                  snapshot.data!.applyList![index].deviceType),
                              icon: const Icon(Icons.close)),
                        );
                      },
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
