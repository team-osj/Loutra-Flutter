import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_bloc.dart';
import 'package:lotura/presentation/notice_page/bloc/notice_state.dart';
import 'package:lotura/presentation/notice_page/ui/widget/notice_list_tile.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.r,
        leading: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 24.0.r, right: 12.0.r),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: LoturaColors.black,
                size: 30.0.r,
              ),
            ),
            Text(
              "공지",
              style: TextStyle(
                fontSize: 24.0.sp,
                color: LoturaColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 12.0.h,
          bottom: 12.0.h,
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0.r),
          child: BlocBuilder<NoticeBloc, NoticeState<List<NoticeEntity>>>(
            builder: (context, state) => switch (state) {
              Empty() => const Center(child: Text("비어있음")),
              Loading() => const Center(child: CircularProgressIndicator()),
              Error() => const Center(child: Text("인터넷 연결을 확인해주세요")),
              Loaded() => SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return NoticeListTile(noticeEntity: state.data[index]);
                    },
                  ),
                ),
            },
          ),
        ),
      ),
    );
  }
}
