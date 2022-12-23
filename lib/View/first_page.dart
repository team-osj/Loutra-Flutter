import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/custom_dialog.dart';
import 'package:osj_flutter/Widget/custom_icons.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/View/color_func.dart';
import 'package:osj_flutter/View/icon_func.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key, required this.future}) : super(key: key);
  Future<OsjList>? future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '1',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![0].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![0].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 9);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            ' 9',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(
                                snapshot.data!.tests![8].deviceType.toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![8].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 2);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '2',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![1].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![1].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 10);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '10',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(
                                snapshot.data!.tests![9].deviceType.toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![9].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 3);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '3',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![2].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![2].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 11);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '11',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![10].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![10].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 4);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '4',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![3].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![3].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 12);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '12',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![11].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![11].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 5);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '5',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![4].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![4].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 13);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '13',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![12].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![12].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 6);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '6',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![5].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![5].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 14);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '14',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![13].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![13].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 7);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '7',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![6].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![6].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 15);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '15',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![14].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![14].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 8);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '8',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: iconFunc(snapshot.data!.tests![7].deviceType
                                  .toString()),
                              iconSize: 49.0.r,
                              color: colorFunc(
                                  snapshot.data!.tests![7].state!.toInt())),
                        ],
                      ),
                    ),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  GestureDetector(
                    onTap: () {
                      showPopup(context, 16);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20.0)),
                      width: 110.0.w,
                      height: 60.0.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '16',
                            style: TextStyle(fontSize: 25.0.sp),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: iconFunc(snapshot.data!.tests![15].deviceType
                                .toString()),
                            iconSize: 49.0.r,
                            color: colorFunc(
                                snapshot.data!.tests![15].state!.toInt()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
