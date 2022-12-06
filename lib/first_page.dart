import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/model/list_model.dart';
import 'package:osj_flutter/view_model/get_status.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  Stream<OsjList>? stream;

  @override
  void initState() {
    super.initState();
    stream = getStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<OsjList>(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                    color: snapshot.data!.tests![0].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                    color: snapshot.data!.tests![8].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![1].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![9].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![2].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![10].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![3].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![11].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![4].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![12].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![5].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![13].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![6].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                    color: snapshot.data!.tests![14].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                    color: snapshot.data!.tests![7].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                    color: snapshot.data!.tests![15].state == 0
                        ? Colors.red
                        : Colors.green,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
