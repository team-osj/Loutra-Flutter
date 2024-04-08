import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lotura/domain/entity/notice_entity.dart';
import 'package:lotura/presentation/utils/lotura_colors.dart';

class NoticeListTile extends StatefulWidget {
  final NoticeEntity noticeEntity;

  const NoticeListTile({super.key, required this.noticeEntity});

  @override
  State<NoticeListTile> createState() => _NoticeListTileState();
}

class _NoticeListTileState extends State<NoticeListTile> {
  bool _tap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _tap = !_tap),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.5.h),
        padding: EdgeInsets.all(20.0.r),
        decoration: const BoxDecoration(
            color: LoturaColors.white,
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.noticeEntity.title,
                style: TextStyle(fontSize: 16.0.sp)),
            Text(widget.noticeEntity.date, style: TextStyle(fontSize: 10.0.sp)),
            _tap
                ? ListView(
                    padding: EdgeInsets.only(top: 10.0.r),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Text(
                        widget.noticeEntity.contents,
                        style: TextStyle(fontSize: 16.0.sp),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
