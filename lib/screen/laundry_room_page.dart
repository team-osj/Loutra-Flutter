import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/screen/setting_page.dart';
import 'package:lotura/widget/osj_colors.dart';
import 'package:lotura/widget/custom_row_buttons.dart';
import 'package:lotura/widget/osj_icons.dart';
import 'package:lotura/widget/osj_text_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaundryRoomPage extends StatefulWidget {
  const LaundryRoomPage({super.key, required this.osjList});

  final OsjList osjList;

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage> {
  int isSelectedIcon = 1, isSelectedPlace = 0;

  Future<void> initSharedPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int selectedIndex = pref.getInt('selectedIndex') ?? 0;
    isSelectedPlace = selectedIndex;
    setState(() {});
  }

  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  final Map placeIndex = <int, int>{0: 0, 1: 16, 2: 31};

  final Map status = <int, Status>{
    0: Status.working,
    1: Status.available,
    2: Status.breakdown
  };

  final Map machine = <String, Machine>{
    "WASH": Machine.WASH,
    "DRY": Machine.DRY
  };

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OSJColors.gray100,
      appBar: AppBar(
        backgroundColor: OSJColors.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.w,
        leading: Row(
          children: [
            SizedBox(width: 24.0.w),
            Text(
              place[isSelectedPlace],
              style: TextStyle(
                color: OSJColors.black,
                fontSize: 24.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingPage())),
            icon: Icon(Icons.settings, color: OSJColors.black),
          ),
          SizedBox(width: 24.0.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 12.0.h,
                bottom: 12.0.h,
              ),
              child: Row(
                children: [
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 0),
                    width: 99.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 0
                        ? OSJColors.white
                        : OSJColors.gray100,
                    fontColor: isSelectedPlace == 0
                        ? OSJColors.primary700
                        : OSJColors.gray300,
                    text: "남자 학교측",
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 1),
                    width: 111.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 1
                        ? OSJColors.white
                        : OSJColors.gray100,
                    fontColor: isSelectedPlace == 1
                        ? OSJColors.primary700
                        : OSJColors.gray300,
                    text: "남자 기숙사측",
                    radius: 8.0,
                  ),
                  SizedBox(width: 8.0.w),
                  OSJTextButton(
                    function: () => setState(() => isSelectedPlace = 2),
                    width: 53.0.w,
                    height: 32.0.h,
                    fontSize: 16.0.sp,
                    color: isSelectedPlace == 2
                        ? OSJColors.white
                        : OSJColors.gray100,
                    fontColor: isSelectedPlace == 2
                        ? OSJColors.primary700
                        : OSJColors.gray300,
                    text: "여자",
                    radius: 8.0,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSelectedIcon = 0;
                    });
                  },
                  icon: Icon(OSJIcons.grid,
                      size: 18.0.r,
                      color: isSelectedIcon == 0
                          ? OSJColors.black
                          : OSJColors.gray300),
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isSelectedIcon = 1;
                      });
                    },
                    icon: Icon(
                      OSJIcons.list,
                      size: 18.0.r,
                      color: isSelectedIcon == 1
                          ? OSJColors.black
                          : OSJColors.gray300,
                    )),
              ],
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior().copyWith(overscroll: false),
                child: ListView.builder(
                  itemCount: isSelectedPlace == 2 ? 10 : 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomRowButton(
                          isSelectedIcon: isSelectedIcon,
                          isWoman: isSelectedPlace == 2 ? true : false,
                          leftIndex: widget.osjList
                              .tests![placeIndex[isSelectedPlace] + index].id,
                          leftStatus: status[widget
                              .osjList
                              .tests![placeIndex[isSelectedPlace] + index]
                              .state],
                          leftMachine: machine[widget
                              .osjList
                              .tests![placeIndex[isSelectedPlace] + index]
                              .deviceType],
                          rightIndex: placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8) <
                                  44
                              ? widget
                                  .osjList
                                  .tests![placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8)]
                                  .id
                              : -1,
                          rightStatus: placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8) <
                                  44
                              ? status[widget
                                  .osjList
                                  .tests![placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8)]
                                  .state]
                              : Status.breakdown,
                          rightMachine: placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8) <
                                  44
                              ? machine[widget
                                  .osjList
                                  .tests![placeIndex[isSelectedPlace] +
                                      index +
                                      (isSelectedPlace == 2 ? 10 : 8)]
                                  .deviceType]
                              : Machine.DRY,
                        ),
                        SizedBox(height: 10.0.h),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
