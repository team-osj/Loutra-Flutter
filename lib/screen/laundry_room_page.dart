import 'package:flutter/material.dart';
import 'package:lotura/widget/custom_colors.dart';

class LaundryRoomPage extends StatefulWidget {
  const LaundryRoomPage({super.key});

  @override
  State<LaundryRoomPage> createState() => _LaundryRoomPageState();
}

class _LaundryRoomPageState extends State<LaundryRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: OsjColor.gray100,
    );
  }
}
