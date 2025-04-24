import 'package:bouncy_background/src/controller/bouncy_controller.dart';
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

  // How much the object can move above/below the screen
  final double minusHeight;
  // How much the object can move beyond the left/right edges
  final double minusWidth;

  // have Scaffold
  final bool isScaffold;

  // bouncy widget
  final Widget bouncyWidget;

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
    required this.bouncyWidget,
    super.key,
  });

  @override
  State<BouncyBackground> createState() => _BouncyBackgroundState();
}

class _BouncyBackgroundState extends State<BouncyBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 1),
    )..addListener(() {
        BoxController.instance.updateBoxes();
        setState(() {});
      });
    _controller.repeat(); // repeat
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boxes = BoxController().boxes(
      minusWidth: widget.minusWidth,
      minusHeight: widget.minusHeight,
    );

    if (!widget.isScaffold) {
      return Stack(
        children: [
          ...boxes.map(
            (box) => BouncyBox(
              left: box.x,
              top: box.y,
              angle: box.angle,
              boxSize: box.boxSize,
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
              boxSize: box.boxSize,
              widget: widget.bouncyWidget,
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}
