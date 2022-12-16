import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/custom_dialog.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/View/color_func.dart';
import 'package:osj_flutter/View/icon_func.dart';

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
                      iconSize: 49.0.r,
                      color:
                          colorFunc(snapshot.data!.tests![16].state!.toInt())),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 25);
                    },
                    icon: const Icon(Icons.dry_cleaning),
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
                    icon: const Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 26);
                    },
                    icon: const Icon(Icons.local_laundry_service_outlined),
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
                    icon: const Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 27);
                    },
                    icon: const Icon(Icons.local_laundry_service_outlined),
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
                    icon: const Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 28);
                    },
                    icon: const Icon(Icons.local_laundry_service_outlined),
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
                    icon: const Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 29);
                    },
                    icon: const Icon(Icons.local_laundry_service_outlined),
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
                    icon: const Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 30);
                    },
                    icon: const Icon(Icons.local_laundry_service_outlined),
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
                    icon: const Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 31);
                    },
                    icon: const Icon(Icons.dry_cleaning),
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
                    icon: const Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
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
