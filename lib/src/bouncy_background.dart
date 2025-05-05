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
  late final AnimationController _controller;
  late final List<Box> boxes;

  @override
  void initState() {
    super.initState();
    boxes = BoxController.instance.boxes(
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
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 여기서 widget.body를 child로 넘겨서, 애니메이션 빌더 안에서 재사용
    final animatedBoxes = AnimatedBuilder(
      animation: _controller,
      child: widget.body,
      builder: (context, child) {
        // 매 프레임 박스 위치만 업데이트
        BoxController.instance.updateBoxes(
          boxHeight: widget.boxHeight,
          boxWidth: widget.boxWidth,
        );
        return Stack(
          children: [
            // 움직이는 박스 레이어
            ...boxes.map((box) => BouncyBox(
                  left: box.x,
                  top: box.y,
                  angle: box.angle,
                  widget: widget.bouncyWidget,
                )),
            // 한 번만 빌드되는 본문
            if (child != null) child,
          ],
        );
      },
    );

    return widget.isScaffold
        ? Scaffold(
            appBar: widget.appBar,
            bottomNavigationBar: widget.bottomNavigationBar,
            floatingActionButton: widget.floatingActionButton,
            backgroundColor: widget.backgroundColor,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            body: animatedBoxes,
          )
        : animatedBoxes;
  }
}
