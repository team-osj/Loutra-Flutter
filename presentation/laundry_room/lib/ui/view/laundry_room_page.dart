import 'package:core/lotura_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as s;
import 'package:laundry_domain/entity/laundry_entity.dart';
import 'package:laundry_room_presentation/bloc/laundry_bloc.dart';
import 'package:laundry_room_presentation/bloc/laundry_model.dart';
import 'package:laundry_room_presentation/bloc/laundry_state.dart';

class LaundryRoomPage extends StatelessWidget {
  LaundryRoomPage({super.key});

  final Map place = <int, String>{
    0: "남자 학교측 세탁실",
    1: "남자 기숙사측 세탁실",
    2: "여자 세탁실",
  };

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColors.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColors.gray100,
        elevation: 0.0,
        leadingWidth: MediaQuery.of(context).size.width,
        title: Padding(
          padding: EdgeInsets.only(left: 10.r),
          child: Text(
            "ㅇㅇㅋㅋ",
            style: TextStyle(
              color: LoturaColors.black,
              fontSize: 22.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: BlocBuilder<LaundryBloc, LaundryState<LaundryModel>>(
                builder: (context, state) {
                  return switch (state) {
                    Empty() => const Center(child: Text("비어있음")),
                    Loading() =>
                      const Center(child: CircularProgressIndicator()),
                    Error() => const Center(child: Text("인터넷 연결을 확인해주세요")),
                    Loaded() => LaundryList(
                        list: state.data.laundryList,
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

class LaundryList extends StatelessWidget {
  LaundryList({
    super.key,
    required this.list,
  });

  final List<LaundryEntity> list;

  final Map<int, int> placeIndex = {0: 0, 1: 16, 2: 31};

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  )
                ],
              ),
              SizedBox(height: 10.0.h),
            ],
          );
        },
      ),
    );
  }
}
