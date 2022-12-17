import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/custom_dialog.dart';
import '../Widget/custom_icons_icons.dart';
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
                  IconButton(
                      onPressed: () {
                        showPopup(context, 1);
                      },
                      icon: iconFunc(
                          snapshot.data!.tests![0].deviceType.toString()),
                      iconSize: 49.0.r,
                      color:
                          colorFunc(snapshot.data!.tests![0].state!.toInt())),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                      onPressed: () {
                        showPopup(context, 9);
                      },
                      icon: iconFunc(
                          snapshot.data!.tests![8].deviceType.toString()),
                      iconSize: 49.0.r,
                      color:
                          colorFunc(snapshot.data!.tests![8].state!.toInt())),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 2);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![1].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![1].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 10);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![9].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![9].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 3);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![2].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![2].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 11);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![10].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![10].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 4);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![3].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![3].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 12);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![11].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![11].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 5);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![4].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![4].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 13);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![12].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![12].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 6);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![5].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![5].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 14);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![13].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![13].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 7);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![6].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![6].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 15);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![14].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![14].state!.toInt()),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 8);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![7].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![7].state!.toInt()),
                  ),
                  const Icon(CustomIcons.triangle_up, color: Colors.grey),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 16);
                    },
                    icon: iconFunc(
                        snapshot.data!.tests![15].deviceType.toString()),
                    iconSize: 49.0.r,
                    color: colorFunc(snapshot.data!.tests![15].state!.toInt()),
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
