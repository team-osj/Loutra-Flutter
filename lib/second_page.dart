import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> _items = List.generate(16, (index) => 'Item ${index + 1}');

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
              color: Colors.red,
            ),
            Icon(
              Icons.dry_cleaning,
              size: 50.0.r,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.green,
            ),
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.green,
            ),
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.green,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.red,
            ),
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.green,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.red,
            ),
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.green,
            ),
            Icon(
              Icons.local_laundry_service_outlined,
              size: 50.0.r,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.dry_cleaning,
              size: 50.0.r,
              color: Colors.red,
            ),
            Icon(
              Icons.dry_cleaning,
              size: 50.0.r,
              color: Colors.red,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.dry_cleaning,
              size: 50.0.r,
              color: Colors.green,
            ),
            SizedBox(
              width: 50.0.w,
              height: 50.0.h,
            ),
          ],
        ),
      ],
    );
  }
}
