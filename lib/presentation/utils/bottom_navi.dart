import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/apply_page/ui/view/apply_page.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/ui/view/laundry_room_page.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:lotura/presentation/utils/osj_icon_button.dart';
import 'package:lotura/presentation/utils/osj_image_button.dart';

class BottomNavi extends StatefulWidget {
  BottomNavi({super.key, required this.nfcTagData});

  int nfcTagData;

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController controller;
  final platformMsg = const MethodChannel('com.osj.lotura/nfc_info');

  int selectedIndex = 1;
  bool isChange = false;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31, 3: 44};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isAndroid) {
      const MethodChannel('com.osj.lotura/nfc_info')
          .invokeMethod('nfcIsAvailable')
          .then(
        (value) {
          if (value.toString() == "false") {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                Hive.openBox<int>("Lotura").then(
                  (value) {
                    if (value.get('다시 보지 않기') == null) {
                      showDialog(
                        context: context,
                        builder: (context) => Center(
                          child: AlertDialog(
                            title: Text(
                              "NFC가 비활성화 되어있습니다.",
                              style: TextStyle(fontSize: 20.0.sp),
                            ),
                            content: Text(
                              "Lotura 서비스 이용을 위해\n스마트폰의 NFC를 설정해주세요.",
                              style: TextStyle(fontSize: 18.0.sp),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            actions: [
                              MaterialButton(
                                  onPressed: () {
                                    value.put('다시 보지 않기', 1);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("다시 보지 않기",
                                      style: TextStyle(fontSize: 16.0.sp))),
                              MaterialButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text("닫기",
                                      style: TextStyle(fontSize: 16.0.sp))),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      );
    }
    if (widget.nfcTagData != -1) {
      for (var i in placeIndex.entries) {
        if (i.value > widget.nfcTagData - 1) {
          context.read<RoomBloc>().add(ModifyRoomIndexEvent(
              roomLocation: RoomLocation.values.elementAt(i.key - 1)));
          break;
        }
      }
    } else {
      context.read<RoomBloc>().add(GetRoomIndexEvent());
    }
    controller = TabController(length: 2, vsync: this)
      ..index = 1
      ..animation?.addListener(() {
        if (controller.offset >= 0.5 &&
            controller.offset < 1.0 &&
            isChange == false) {
          setState(() {
            isChange = true;
            selectedIndex = 1;
          });
        }
        if (controller.offset < 0.5 &&
            controller.offset > 0.0 &&
            isChange == true) {
          setState(() {
            isChange = false;
            selectedIndex = 0;
          });
        }
        if (controller.offset >= -0.5 &&
            controller.offset < 0.0 &&
            isChange == false) {
          setState(() {
            isChange = true;
            selectedIndex = 1;
          });
        }
        if (controller.offset < -0.5 &&
            controller.offset > -1.0 &&
            isChange == true) {
          setState(() {
            isChange = false;
            selectedIndex = 0;
          });
        }
        if (controller.offset == 1.0 || controller.offset == 0.0) {
          setState(() {
            isChange = false;
          });
        }
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        platformMsg.invokeMethod("getNFCInfo").then((value) {
          widget.nfcTagData = (jsonDecode(value)['index'] as int);
          if (widget.nfcTagData != -1) {
            selectedIndex = 1;
            controller.index = 1;
            for (var i in placeIndex.entries) {
              if (i.value > widget.nfcTagData - 1) {
                context.read<RoomBloc>().add(ModifyRoomIndexEvent(
                    roomLocation: RoomLocation.values.elementAt(i.key - 1)));
                break;
              }
            }
            BlocProvider.of<RoomBloc>(context)
                .add(InitialShowBottomSheetEvent());
            setState(() {});
          }
        });
        BlocProvider.of<LaundryBloc>(context).add(GetAllLaundryListEvent());
        BlocProvider.of<LaundryBloc>(context).add(GetLaundryEvent());
        BlocProvider.of<ApplyBloc>(context)
            .add(GetApplyListEvent(getApplyListRequest: GetApplyListRequest()));
      default:
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      body: TabBarView(
        controller: controller,
        children: [
          ApplyPage(),
          LaundryRoomPage(nfcTagData: widget.nfcTagData),
        ],
      ),
      bottomNavigationBar: TabBar(
        padding: EdgeInsets.only(top: 10.0.h, bottom: 30.0.h),
        dividerColor: Colors.transparent,
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          OSJIconButton(
              width: 185.0.w,
              height: 48.0.h,
              iconSize: 24.0.r,
              color: selectedIndex == 0
                  ? LoturaColors.white
                  : LoturaColors.gray100,
              iconColor: selectedIndex == 0
                  ? LoturaColors.primary700
                  : LoturaColors.gray300,
              iconData: Icons.home),
          OSJImageButton(
            width: 185.0.w,
            height: 48.0.h,
            color:
                selectedIndex == 1 ? LoturaColors.white : LoturaColors.gray100,
            imagePath: selectedIndex == 1
                ? "assets/applogo.jpeg"
                : "assets/applogo_unselected.jpeg",
          ),
        ],
      ),
    );
  }
}
