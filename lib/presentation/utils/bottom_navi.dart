import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/laundry_room_page/ui/view/laundry_room_page.dart';
import 'package:lotura/presentation/main_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/main_page/bloc/apply_event.dart';
import 'package:lotura/presentation/main_page/ui/view/main_page.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';
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

  final Map status = <int, Status>{
    0: Status.working,
    1: Status.available,
    2: Status.disconnected,
    3: Status.breakdown
  };

  final Map machine = <String, Machine>{
    "WASH": Machine.wash,
    "DRY": Machine.dry
  };

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
      backgroundColor: OSJColors.gray100,
      body: TabBarView(
        controller: controller,
        children: [
          MainPage(),
          LaundryRoomPage(nfcTagData: widget.nfcTagData),
        ],
      ),
      bottomNavigationBar: TabBar(
        padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
        controller: controller,
        indicatorColor: Colors.transparent,
        tabs: [
          OSJIconButton(
              width: 185.0.w,
              height: 48.0.h,
              iconSize: 24.0.r,
              color: selectedIndex == 0 ? OSJColors.white : OSJColors.gray100,
              iconColor:
                  selectedIndex == 0 ? OSJColors.primary700 : OSJColors.gray300,
              iconData: Icons.home),
          OSJImageButton(
            width: 185.0.w,
            height: 48.0.h,
            color: selectedIndex == 1 ? OSJColors.white : OSJColors.gray100,
            imagePath: selectedIndex == 1
                ? "assets/applogo.jpeg"
                : "assets/applogo_unselected.jpeg",
          ),
        ],
      ),
    );
  }
}
