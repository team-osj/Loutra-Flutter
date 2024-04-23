import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VibratingWidget extends StatefulWidget {
  const VibratingWidget({super.key, required this.child});

  final Widget child;

  @override
  State<VibratingWidget> createState() => _VibratingWidgetState();
}

class _VibratingWidgetState extends State<VibratingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 100), vsync: this);

    _animation = Tween(begin: 0.0, end: 4.0.r).animate(_animationController);

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) => Transform.translate(
        offset: Offset(_animation.value - 2.0.r, 0),
        child: widget.child,
      ),
    );
  }
}
