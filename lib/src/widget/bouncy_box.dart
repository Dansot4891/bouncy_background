import 'package:flutter/material.dart';

class BouncyBox extends StatelessWidget {
  final double left;
  final double top;
  final double angle;
  final Widget widget;
  const BouncyBox({
    required this.left,
    required this.top,
    required this.angle,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: widget,
      ),
    );
  }
}
