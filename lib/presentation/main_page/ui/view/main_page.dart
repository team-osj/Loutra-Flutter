import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/main_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/main_page/bloc/apply_event.dart';
import 'package:lotura/presentation/main_page/bloc/apply_state.dart';
import 'package:lotura/presentation/setting_page/ui/view/setting_page.dart';
import 'package:lotura/presentation/utils/machine_card.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  int selectedIndex = 0;

  final TextStyle bigStyle = TextStyle(
    fontSize: 40.0.sp,
    color: OSJColors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle smallStyle = TextStyle(
    fontSize: 16.0.sp,
    color: OSJColors.gray500,
  );

  final Map machine = <String, Machine>{
    "WASH": Machine.wash,
    "DRY": Machine.dry,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        BlocProvider.of<ApplyBloc>(context)
            .add(GetApplyListEvent(getApplyListRequest: GetApplyListRequest()));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OSJColors.gray100,
      appBar: AppBar(
        backgroundColor: OSJColors.gray100,
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
                  color: OSJColors.primary700,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage())),
              icon: Icon(
                Icons.settings,
                color: OSJColors.black,
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
            SizedBox(height: 20.0.h),
            Expanded(
              child: BlocBuilder<ApplyBloc, ApplyState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return const Center(child: Text("비어있음"));
                  } else if (state is Loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is Error) {
                    return Center(child: Text(state.message));
                  } else if (state is Loaded) {
                    return ScrollConfiguration(
                      behavior:
                          const ScrollBehavior().copyWith(overscroll: false),
                      child: ListView.builder(
                          itemCount: state.applyList.length.isEven
                              ? state.applyList.length ~/ 2
                              : state.applyList.length ~/ 2 + 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MachineCard(
                                        index:
                                            state.applyList[index * 2].deviceId,
                                        isEnableNotification: false,
                                        isWoman: state.applyList[index * 2]
                                                    .deviceId >
                                                31
                                            ? true
                                            : false,
                                        machine: machine[state
                                            .applyList[index * 2].deviceType],
                                        status: Status.working),
                                    index * 2 + 1 < state.applyList.length
                                        ? MachineCard(
                                            index: state
                                                .applyList[index * 2 + 1]
                                                .deviceId,
                                            isEnableNotification: false,
                                            isWoman:
                                                state.applyList[index * 2 + 1]
                                                            .deviceId >
                                                        31
                                                    ? true
                                                    : false,
                                            machine: machine[state
                                                .applyList[index * 2 + 1]
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
                          }),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
