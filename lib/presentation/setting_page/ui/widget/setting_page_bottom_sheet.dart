import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/room_entity.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/utils/osj_colors.dart';

class SettingPageBottomSheet extends StatelessWidget {
  final int initialIndex;

  const SettingPageBottomSheet({super.key, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState<RoomEntity>>(
        builder: (context, state) {
      if (state is Initial) {
        context.read<RoomBloc>().add(GetRoomIndexEvent());
        return const SizedBox.shrink();
      } else if (state is Changed) {
        return SizedBox(
          height: 310.0.h,
          child: Padding(
            padding: EdgeInsets.only(
              top: 32.0.h,
              left: 24.0.w,
              right: 24.0.w,
              bottom: 12.0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "메인 세탁실 설정",
                  style: TextStyle(
                      color: OSJColors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0.sp),
                ),
                SizedBox(height: 4.0.h),
                Text(
                  "세탁실 탭에서 처음에 보여질 세탁실을 선택해보세요.",
                  style: TextStyle(fontSize: 16.0.sp, color: OSJColors.black),
                ),
                SizedBox(height: 24.0.h),
                GestureDetector(
                  onTap: () => context
                      .read<RoomBloc>()
                      .add(UpdateRoomIndexEvent(roomIndex: 0)),
                  child: Container(
                    width: 382.0.w,
                    height: 48.0.h,
                    decoration: BoxDecoration(
                      color: state.value.roomIndex == 0
                          ? OSJColors.gray100
                          : OSJColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(12.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "남자 학교측",
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            color: OSJColors.black,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: 24.0.r,
                          color: state.value.roomIndex == 0
                              ? OSJColors.black
                              : OSJColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<RoomBloc>()
                      .add(UpdateRoomIndexEvent(roomIndex: 1)),
                  child: Container(
                    width: 382.0.w,
                    height: 48.0.h,
                    decoration: BoxDecoration(
                      color: state.value.roomIndex == 1
                          ? OSJColors.gray100
                          : OSJColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(12.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "남자 기숙사측",
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            color: OSJColors.black,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: 24.0.r,
                          color: state.value.roomIndex == 1
                              ? OSJColors.black
                              : OSJColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => context
                      .read<RoomBloc>()
                      .add(UpdateRoomIndexEvent(roomIndex: 2)),
                  child: Container(
                    width: 382.0.w,
                    height: 48.0.h,
                    decoration: BoxDecoration(
                      color: state.value.roomIndex == 2
                          ? OSJColors.gray100
                          : OSJColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(12.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "여자",
                          style: TextStyle(
                            fontSize: 16.0.sp,
                            color: OSJColors.black,
                          ),
                        ),
                        Icon(
                          Icons.check,
                          size: 24.0.r,
                          color: state.value.roomIndex == 2
                              ? OSJColors.black
                              : OSJColors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
