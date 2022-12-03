import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
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
              Icons.local_laundry_service_outlined,
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
              Icons.dry_cleaning,
              size: 50.0.r,
            ),
          ],
        ),
      ],
    );
  }
}
