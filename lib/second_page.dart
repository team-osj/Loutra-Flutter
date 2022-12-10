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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.local_laundry_service_outlined),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dry_cleaning),
                    iconSize: 49.0.r,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.dry_cleaning),
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
