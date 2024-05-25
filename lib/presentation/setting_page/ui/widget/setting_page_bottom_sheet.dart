import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/main.dart';
import 'package:lotura/presentation/setting_page/bloc/laundry_room_model.dart';
import 'package:lotura/presentation/setting_page/bloc/room_bloc.dart';
import 'package:lotura/presentation/setting_page/bloc/room_event.dart';
import 'package:lotura/presentation/setting_page/bloc/room_state.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class SettingPageBottomSheet extends StatelessWidget {
  const SettingPageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomBloc, RoomState<LaundryRoomModel>>(
      builder: (context, state) {
        return switch (state) {
          Initial() => const SizedBox.shrink(),
          Changed() => Container(
              padding: EdgeInsets.all(24.0.r),
              decoration: const BoxDecoration(
                color: LoturaColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Wrap(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "메인 세탁실 설정",
                      style: TextStyle(
                          color: LoturaColors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 30.0.sp),
                    ),
                  ),
                  SizedBox(height: 4.0.h),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "세탁실 탭에서 처음에 보여질 세탁실을 선택해보세요.",
                      style: TextStyle(
                          fontSize: 25.0.sp, color: LoturaColors.black),
                    ),
                  ),
                  SizedBox(height: 30.0.r),
                  CheckButton(
                    gender: Gender.boy,
                    roomLocation: RoomLocation.schoolSide,
                    currentRoomLocation: state.data.roomLocation,
                  ),
                  CheckButton(
                    gender: Gender.girl,
                    roomLocation: RoomLocation.schoolGirlSide,
                    currentRoomLocation: state.data.roomLocation,
                  ),
                ],
              ),
            ),
        };
      },
    );
  }
}

class CheckButton extends StatelessWidget {
  const CheckButton({
    super.key,
    required this.gender,
    required this.roomLocation,
    required this.currentRoomLocation,
  });

  final Gender gender;
  final RoomLocation roomLocation, currentRoomLocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<RoomBloc>()
          .add(UpdateRoomIndexEvent(roomLocation: roomLocation)),
      child: Container(
        decoration: BoxDecoration(
          color: currentRoomLocation == roomLocation
              ? LoturaColors.gray100
              : LoturaColors.white,
          borderRadius: BorderRadius.circular(8.0.r),
        ),
        padding: EdgeInsets.all(12.0.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                gender.text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.0.sp,
                  color: LoturaColors.black,
                ),
              ),
            ),
            Icon(
              Icons.check,
              size: 24.0.r,
              color: currentRoomLocation == roomLocation
                  ? LoturaColors.black
                  : LoturaColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
