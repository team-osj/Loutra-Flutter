import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lotura/model/apply_list.dart';
import 'package:lotura/service/receive_apply_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StreamDrawer extends StatefulWidget {
  StreamDrawer({Key? key}) : super(key: key);

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
            height: 520.0.h,
            child: StreamBuilder<ApplyList>(
              stream: controller.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.only(top: 20.0.w),
                    itemCount: snapshot.data!.applyList!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          snapshot.data!.applyList![index].deviceId.toString(),
                        ),
                      );
                    },
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
