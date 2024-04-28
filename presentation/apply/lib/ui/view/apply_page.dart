import 'package:apply_presentation/bloc/apply_bloc.dart';
import 'package:apply_presentation/bloc/apply_model.dart';
import 'package:apply_presentation/bloc/apply_state.dart';
import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;

class ApplyPage extends StatelessWidget {
  ApplyPage({super.key});

  final TextStyle bigStyle = TextStyle(
    fontSize: 32.0.sp,
    color: LoturaColors.black,
    fontWeight: FontWeight.bold,
  );

  final TextStyle smallStyle = TextStyle(
    fontSize: 18.0.sp,
    color: LoturaColors.gray500,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
          padding: EdgeInsets.only(left: 10.0.r),
          child: Row(
            children: [
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
                    color: LoturaColors.primary700,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 36.0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("알림 설정한\n세탁기와 건조기", style: bigStyle),
                  SizedBox(height: 24.0.h),
                  Text("알림을 설정하여 세탁기와 건조기를\n누구보다 빠르게 사용해보세요.",
                      style: smallStyle),
                ],
              ),
            ),
            SizedBox(height: 20.0.h),
            Expanded(
              child: BlocBuilder<ApplyBloc, ApplyState<ApplyModel>>(
                builder: (context, state) {
                  return switch (state) {
                    Empty() => const Center(child: Text("비어있음")),
                    Loading() =>
                      const Center(child: CircularProgressIndicator()),
                    Error() => const Center(child: Text("인터넷 연결을 확인해주세요")),
                    Loaded() => ScrollConfiguration(
                        behavior:
                            const ScrollBehavior().copyWith(overscroll: false),
                        child: ListView.builder(
                          itemCount: state.value.applyList.length.isEven
                              ? state.value.applyList.length ~/ 2
                              : state.value.applyList.length ~/ 2 + 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.red,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 100,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0.r),
                              ],
                            );
                          },
                        ),
                      ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
