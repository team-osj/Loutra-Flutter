import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/init/socket_init.dart';
import 'package:lotura/domain/model/osj_list.dart';
import 'package:lotura/presentation/splash_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/splash_page/bloc/apply_event.dart';
import 'package:lotura/presentation/splash_page/bloc/osj_bloc.dart';
import 'package:lotura/presentation/splash_page/bloc/osj_event.dart';
import 'package:lotura/presentation/utils/bottom_navi.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<OSJBloc>().add(GetOSJEvent());
    context.read<ApplyBloc>().add(GetApplyListEvent());
    Future.delayed(const Duration(milliseconds: 1100)).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavi(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OSJColors.gray100,
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
            Text(
              'OSJ',
              style: TextStyle(
                color: OSJColors.primary700,
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
