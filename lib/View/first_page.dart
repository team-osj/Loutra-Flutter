import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/show_popup.dart';
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
              customRowButtons(
                  context,
                  '1',
                  snapshot.data!.tests![0].deviceType.toString(),
                  snapshot.data!.tests![0].state!.toInt(),
                  ' 9',
                  snapshot.data!.tests![8].deviceType.toString(),
                  snapshot.data!.tests![8].state!.toInt()),
              customRowButtons(
                  context,
                  '2',
                  snapshot.data!.tests![1].deviceType.toString(),
                  snapshot.data!.tests![1].state!.toInt(),
                  '10',
                  snapshot.data!.tests![9].deviceType.toString(),
                  snapshot.data!.tests![9].state!.toInt()),
              customRowButtons(
                  context,
                  '3',
                  snapshot.data!.tests![2].deviceType.toString(),
                  snapshot.data!.tests![2].state!.toInt(),
                  '11',
                  snapshot.data!.tests![10].deviceType.toString(),
                  snapshot.data!.tests![10].state!.toInt()),
              customRowButtons(
                  context,
                  '4',
                  snapshot.data!.tests![3].deviceType.toString(),
                  snapshot.data!.tests![3].state!.toInt(),
                  '12',
                  snapshot.data!.tests![11].deviceType.toString(),
                  snapshot.data!.tests![11].state!.toInt()),
              customRowButtons(
                  context,
                  '5',
                  snapshot.data!.tests![4].deviceType.toString(),
                  snapshot.data!.tests![4].state!.toInt(),
                  '13',
                  snapshot.data!.tests![12].deviceType.toString(),
                  snapshot.data!.tests![12].state!.toInt()),
              customRowButtons(
                  context,
                  '6',
                  snapshot.data!.tests![5].deviceType.toString(),
                  snapshot.data!.tests![5].state!.toInt(),
                  '14',
                  snapshot.data!.tests![13].deviceType.toString(),
                  snapshot.data!.tests![13].state!.toInt()),
              customRowButtons(
                  context,
                  '7',
                  snapshot.data!.tests![6].deviceType.toString(),
                  snapshot.data!.tests![6].state!.toInt(),
                  '15',
                  snapshot.data!.tests![14].deviceType.toString(),
                  snapshot.data!.tests![14].state!.toInt()),
              customRowButtons(
                  context,
                  '8',
                  snapshot.data!.tests![7].deviceType.toString(),
                  snapshot.data!.tests![7].state!.toInt(),
                  '16',
                  snapshot.data!.tests![15].deviceType.toString(),
                  snapshot.data!.tests![15].state!.toInt()),
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

  customRowButtons(BuildContext context, String a, String aDeviceType,
      int aState, String b, String bDeviceType, int bState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            showPopup(context, a);
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
                  a.toString(),
                  style: TextStyle(fontSize: 25.0.sp),
                ),
                IconButton(
                    onPressed: () {},
                    icon: iconFunc(aDeviceType),
                    iconSize: 40.0.r,
                    color: colorFunc(aState)),
              ],
            ),
          ),
        ),
        const Icon(CustomIcons.triangle_up, color: Colors.grey),
        GestureDetector(
          onTap: () {
            showPopup(context, b);
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
                  b.toString(),
                  style: TextStyle(fontSize: 25.0.sp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: iconFunc(bDeviceType),
                  iconSize: 40.0.r,
                  color: colorFunc(bState),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
