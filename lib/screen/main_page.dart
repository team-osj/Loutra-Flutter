import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lotura/main.dart';
import 'package:lotura/model/apply_response_list.dart';
import 'package:lotura/model/osj_list.dart';
import 'package:lotura/service/receive_apply_list.dart';
import 'package:lotura/widget/custom_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/widget/custom_row_buttons.dart';
import 'package:lotura/widget/machine_card.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key, required this.osjList});

  OsjList osjList;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  late StreamController<ApplyResponseList> applyResponseController;

  @override
  void initState() {
    super.initState();
    applyResponseController = StreamController<ApplyResponseList>();
    receiveApplyList(applyResponseController);
  }

  TextStyle bigStyle = TextStyle(
    fontSize: 40.0.sp,
    color: OsjColor.black,
    fontWeight: FontWeight.bold,
  );

  TextStyle smallStyle = TextStyle(
    fontSize: 16.0.sp,
    color: OsjColor.gray500,
  );

  Map machine = <String, Machine>{
    "WASH": Machine.WASH,
    "DRY": Machine.DRY,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsjColor.gray100,
      appBar: AppBar(
        backgroundColor: OsjColor.gray100,
        elevation: 0.0,
        leadingWidth: 200.0.w,
        leading: Row(
          children: [
            SizedBox(width: 24.0.w),
            Image.asset(
              "assets/applogo.jpeg",
              width: 24.0.w,
              height: 24.0.h,
            ),
            SizedBox(width: 8.0.w),
            Text(
              "OSJ",
              style: TextStyle(
                  fontSize: 20.0.sp,
                  color: OsjColor.primary700,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: OsjColor.black,
              )),
          SizedBox(width: 24.0.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 36.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("알림 설정한", style: bigStyle),
                Text("세탁기와 건조기", style: bigStyle),
                SizedBox(height: 24.0.h),
                Text("알림을 설정하여 세탁기와 건조기를", style: smallStyle),
                SizedBox(height: 5.0.h),
                Text("누구보다 빠르게 사용해보세요.", style: smallStyle),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                  stream: applyResponseController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!.applyResponseList!.length);
                      return ListView.builder(
                          itemCount: snapshot
                                  .data!.applyResponseList!.length.isEven
                              ? snapshot.data!.applyResponseList!.length ~/ 2
                              : snapshot.data!.applyResponseList!.length ~/ 2 +
                                  1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MachineCard(
                                        osjStreamController:
                                            applyResponseController,
                                        index: snapshot
                                            .data!
                                            .applyResponseList![index * 2]
                                            .deviceId,
                                        isEnableNotification: false,
                                        isWoman: false,
                                        machine: machine[snapshot
                                            .data!
                                            .applyResponseList![index * 2]
                                            .deviceType],
                                        status: Status.working),
                                    index * 2 + 1 <
                                            snapshot
                                                .data!.applyResponseList!.length
                                        ? MachineCard(
                                            osjStreamController:
                                                applyResponseController,
                                            index: snapshot
                                                .data!
                                                .applyResponseList![
                                                    index * 2 + 1]
                                                .deviceId,
                                            isEnableNotification: false,
                                            isWoman: false,
                                            machine: machine[snapshot
                                                .data!
                                                .applyResponseList![
                                                    index * 2 + 1]
                                                .deviceType],
                                            status: Status.working)
                                        : SizedBox(
                                            width: 185.0.w,
                                            height: 256.0.h,
                                          ),
                                  ],
                                ),
                                SizedBox(height: 10.0.h),
                              ],
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
