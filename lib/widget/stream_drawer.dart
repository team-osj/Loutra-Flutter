import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lotura/Widget/custom_icons.dart';
import 'package:lotura/model/apply_response_list.dart';
import 'package:lotura/service/receive_apply_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/remove_popup.dart';

class StreamDrawer extends StatefulWidget {
  const StreamDrawer({Key? key}) : super(key: key);

  @override
  State<StreamDrawer> createState() => _StreamDrawerState();
}

class _StreamDrawerState extends State<StreamDrawer> {
  late StreamController<ApplyResponseList> controller;

  @override
  void initState() {
    super.initState();
    controller = StreamController<ApplyResponseList>();
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
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            child: StreamBuilder<ApplyResponseList>(
              stream: controller.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8.0.h),
                      itemCount: snapshot.data!.applyResponseList!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Icon(
                                snapshot.data!.applyResponseList![index]
                                            .deviceType ==
                                        "DRY"
                                    ? CustomIcons.dryer
                                    : CustomIcons.washingMachine,
                                color: Colors.blue,
                                size: 28.0.r,
                              ),
                              title: Text(
                                "${snapshot.data!.applyResponseList![index].deviceId}번 ${snapshot.data!.applyResponseList![index].deviceType == "WASH" ? "세탁기" : "건조기"} 작동 중",
                                style: TextStyle(fontSize: 16.0.sp),
                              ),
                              trailing: IconButton(
                                padding: EdgeInsets.only(left: 20.0.w),
                                onPressed: () => removePopup(
                                    controller,
                                    context,
                                    snapshot.data!.applyResponseList![index]
                                        .deviceId,
                                    snapshot.data!.applyResponseList![index]
                                        .deviceType),
                                icon: const Icon(Icons.close),
                              ),
                            ),
                            const Divider(),
                          ],
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
