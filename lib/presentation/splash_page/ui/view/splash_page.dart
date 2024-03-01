import 'dart:async';
import 'dart:io';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/presentation/app_update_page/ui/app_update_page.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/utils/bottom_navi.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.nfcTagData});

  final int nfcTagData;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> checkAppVersion() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();

    String firebaseVersion = remoteConfig.getString(
        Platform.isAndroid ? "ANDROID_APP_VERSION" : "iOS_APP_VERSION");

    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appVersion = packageInfo.version;

    if (firebaseVersion != appVersion) {
      Future.delayed(Duration.zero).then((value) =>
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const AppUpdatePage()),
              (route) => false));
    } else {
      Future.delayed(const Duration(seconds: 1)).then(
        (value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => BottomNavi(nfcTagData: widget.nfcTagData),
              ),
              (route) => false);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkAppVersion();
    context.read<LaundryBloc>().add(GetAllLaundryListEvent());
    context.read<LaundryBloc>().add(GetLaundryEvent());
    context
        .read<ApplyBloc>()
        .add(GetApplyListEvent(getApplyListRequest: GetApplyListRequest()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/applogo.jpeg",
              width: 100.0.r,
              height: 100.0.r,
            ),
            SizedBox(height: 12.0.h),
            const Text(
              'OSJ',
              style: TextStyle(
                color: LoturaColors.primary700,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
