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
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: () {
                          showPopup(context, index + 1);
                        },
                        icon: iconFunc(snapshot.data!.tests![index].deviceType
                            .toString()),
                        iconSize: 49.0.r,
                        color: colorFunc(
                            snapshot.data!.tests![index].state!.toInt())),
                    const Icon(CustomIcons.triangle_up, color: Colors.grey),
                    IconButton(
                      onPressed: () {
                        showPopup(context, index + 9);
                      },
                      icon: iconFunc(snapshot
                          .data!.tests![index + 9].deviceType
                          .toString()),
                      iconSize: 49.0.r,
                      color: colorFunc(
                          snapshot.data!.tests![index + 9].state!.toInt()),
                    ),
                  ],
                ),
              );
            },
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
