import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/custom_dialog.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/View/color_func.dart';
import 'package:osj_flutter/View/icon_func.dart';
import 'package:osj_flutter/Widget/custom_icons_icons.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.future}) : super(key: key);

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
                  IconButton(
                    onPressed: () {
                      showPopup(context, 17);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![16].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![16].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 25);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![24].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![23].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 18);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![17].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![17].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 26);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![25].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![24].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 19);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![18].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![18].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 27);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![26].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![26].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 20);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![19].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![19].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 28);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![27].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![26].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 21);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![20].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![20].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 29);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![28].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![28].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 22);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![21].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![21].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 30);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![29].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![29].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 23);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![22].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![22].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 31);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![30].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![30].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 24);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![23].deviceType.toString()),
                    color: colorFunc(snapshot.data!.tests![23].state!.toInt()),
                    iconSize: 49.0.r,
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  SizedBox(
                    width: 65.0.w,
                    height: 60.0.h,
                  )
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
