import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:osj_flutter/model/list_model.dart';

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
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.local_laundry_service_outlined,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                  ),
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.dry_cleaning,
                    size: 50.0.r,
                  ),
                  SizedBox(
                    width: 50.0.w,
                    height: 50.0.h,
                  ),
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
