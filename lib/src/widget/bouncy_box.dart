import 'package:flutter/material.dart';

class BouncyBox extends StatelessWidget {
  final double left;
  final double top;
  final double angle;
  final double boxSize;
  final Color? color;
  const BouncyBox({
    required this.left,
    required this.top,
    required this.angle,
    required this.boxSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: boxSize,
          height: boxSize,
          decoration: BoxDecoration(color: color),
        ),
      ),
    );
  }
}
