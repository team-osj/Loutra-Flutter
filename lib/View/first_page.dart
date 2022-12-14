import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/Widget/custom_dialog.dart';
import 'package:osj_flutter/model/list_model.dart';

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
                    icon: snapshot.data!.tests![0].alive == 1
                        ? const Icon(Icons.dry_cleaning)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![0].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 9);
                    },
                    icon: snapshot.data!.tests![8].alive == 1
                        ? const Icon(Icons.dry_cleaning)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![8].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      showPopup(context, 2);
                    },
                    icon: snapshot.data!.tests![1].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![1].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 10);
                    },
                    icon: snapshot.data!.tests![9].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![9].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![2].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![2].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 11);
                    },
                    icon: snapshot.data!.tests![10].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![10].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![3].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![3].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 12);
                    },
                    icon: snapshot.data!.tests![11].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![11].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![4].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![4].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 13);
                    },
                    icon: snapshot.data!.tests![12].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![12].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![5].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![5].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 14);
                    },
                    icon: snapshot.data!.tests![13].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![13].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![6].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![6].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 15);
                    },
                    icon: snapshot.data!.tests![14].alive == 1
                        ? const Icon(Icons.dry_cleaning)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![14].state == 0
                        ? Colors.red
                        : Colors.green,
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
                    icon: snapshot.data!.tests![7].alive == 1
                        ? const Icon(Icons.local_laundry_service_outlined)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![7].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  IconButton(
                    onPressed: () {
                      showPopup(context, 16);
                    },
                    icon: snapshot.data!.tests![15].alive == 1
                        ? const Icon(Icons.dry_cleaning)
                        : const Icon(Icons.do_not_disturb_alt_outlined),
                    iconSize: 49.0.r,
                    color: snapshot.data!.tests![15].state == 0
                        ? Colors.red
                        : Colors.green,
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
