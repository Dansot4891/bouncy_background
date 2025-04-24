import 'package:bouncy_background/src/app_size/bouncy_size.dart';
import 'package:bouncy_background/src/model/box.dart';
import 'package:bouncy_background/src/random/random_generator.dart';

class BoxController {
  // singleton pattern
  static final BoxController instance = BoxController._internal();
  BoxController._internal();
  factory BoxController() => instance;

  // boxes
  final List<Box> _boxes = [];

  // when getting box initilize
  List<Box> boxes({
    double minusWidth = 0,
    double minusHeight = 0,
    required int boxCount,
    required double boxWidth,
    required double boxHeight,
    double? ratationSpeed,
  }) {
    if (!_initialized) {
      _initBoxes(
        minusHeight: minusHeight,
        minusWidth: minusWidth,
        boxCount: boxCount,
        boxWidth: boxWidth,
        boxHeight: boxHeight,
        ratationSpeed: ratationSpeed,
      );
    }
    return _boxes;
  }

  // random generator
  final _random = RandomGenerator();

  // is initialized
  bool _initialized = false;

  // divice width & height
  late double _screenWidth;
  late double _screenHeight;

  // bouncy box init
  void _initBoxes({
    double minusWidth = 0,
    double minusHeight = 0,
    required int boxCount,
    required double boxWidth,
    required double boxHeight,
    double? ratationSpeed,
  }) {
    // if initialized => return
    if (_initialized) return;

    _screenWidth = BouncyDeviceSize.screenWidth - minusWidth;
    _screenHeight = BouncyDeviceSize.screenHeight - minusHeight;
    for (int i = 0; i < boxCount; i++) {
      _boxes.add(
        Box(
          x: _random.nextDouble(0.6) * _screenWidth,
          y: _random.nextDouble(0.6) * _screenHeight,
          dx: _random.nextDouble(1) * 2,
          dy: _random.nextDouble(1) * 2,
          angle: _random.nextDouble(1) * 2,
          rotationSpeed: ratationSpeed ?? (_random.nextDouble(1) - 0.5) * 0.2,
        ),
      );
    }
    _initialized = true;
  }

  // box update
  void updateBoxes({
    required double boxWidth,
    required double boxHeight,
  }) {
    // if initialized => return
    if (!_initialized) {
      return;
    }
    for (var box in _boxes) {
      box.x += box.dx;
      box.y += box.dy;
      box.angle += box.rotationSpeed;

      if (box.x <= 0 || box.x + boxWidth >= _screenWidth) {
        box.dx = -box.dx;
      }
      if (box.y <= 0 || box.y + boxHeight >= _screenHeight) {
        box.dy = -box.dy;
      }
    }
  }
}
