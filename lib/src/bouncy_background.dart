import 'package:bouncy_background/src/controller/bouncy_controller.dart';
import 'package:bouncy_background/src/model/box.dart';
import 'package:bouncy_background/src/widget/bouncy_box.dart';
import 'package:flutter/material.dart';

class BouncyBackground extends StatefulWidget {
  // used for isScaffold = true
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;

  // How much the object can move beyond the right edges
  final double minusWidth;
  // How much the object can move below the screen
  final double minusHeight;

  // have Scaffold
  final bool isScaffold;

  // bouncy widget
  final Widget bouncyWidget;

  // ----- widget variation -----
  // inner widget width
  final double boxWidth;
  // inner widget height
  final double boxHeight;
  // box count
  final int boxCount;
  // rotate speed
  final double? ratationSpeed;

  const BouncyBackground({
    required this.body,
    this.minusWidth = 0,
    this.minusHeight = 0,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.isScaffold = true,
    required this.boxCount,
    required this.bouncyWidget,
    required this.boxWidth,
    required this.boxHeight,
    this.ratationSpeed,
    super.key,
  });

  @override
  State<BouncyBackground> createState() => _BouncyBackgroundState();
}

class _BouncyBackgroundState extends State<BouncyBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Box> boxes;

  @override
  void initState() {
    final boxController = BoxController();
    boxes = boxController.boxes(
      minusWidth: widget.minusWidth,
      minusHeight: widget.minusHeight,
      boxCount: widget.boxCount,
      boxHeight: widget.boxHeight,
      boxWidth: widget.boxWidth,
      ratationSpeed: widget.ratationSpeed,
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    )..addListener(() {
        BoxController.instance.updateBoxes(
          boxHeight: widget.boxHeight,
          boxWidth: widget.boxWidth,
        );
        setState(() {});
      });
    _controller.repeat(); // repeat
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isScaffold) {
      return Stack(
        children: [
          ...boxes.map(
            (box) => BouncyBox(
              left: box.x,
              top: box.y,
              angle: box.angle,
              widget: widget.bouncyWidget,
            ),
          ),
          widget.body,
        ],
      );
    }

    return Scaffold(
      appBar: widget.appBar,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: Stack(
        children: [
          ...boxes.map(
            (box) => BouncyBox(
              left: box.x,
              top: box.y,
              angle: box.angle,
              widget: widget.bouncyWidget,
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}
