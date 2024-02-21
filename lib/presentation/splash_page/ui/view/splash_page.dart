import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/data/dto/request/get_apply_list_request.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_bloc.dart';
import 'package:lotura/presentation/apply_page/bloc/apply_event.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_bloc.dart';
import 'package:lotura/presentation/laundry_room_page/bloc/laundry_event.dart';
import 'package:lotura/presentation/utils/bottom_navi.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.nfcTagData});

  final int nfcTagData;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<LaundryBloc>().add(GetAllLaundryListEvent());
    context.read<LaundryBloc>().add(GetLaundryEvent());
    context
        .read<ApplyBloc>()
        .add(GetApplyListEvent(getApplyListRequest: GetApplyListRequest()));
    Future.delayed(const Duration(milliseconds: 1100)).then(
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
