import 'package:bouncy_background/src/app_size/bouncy_size.dart';
import 'package:bouncy_background/src/random/random_generator.dart';

class BoxController {
  // singleton pattern
  static final BoxController instance = BoxController._internal();
  BoxController._internal();
  factory BoxController() => instance;

  // box variation
  final int _boxCount = 6;
  final double _boxSize = AppSize.ratioWidth(70);
  final List<_Box> _boxes = [];

  // when getting box initilize
  List<_Box> boxes({double minusWidth = 0, double minusHeight = 0}) {
    if (!_initialized) {
      _initBoxes(minusHeight: minusHeight, minusWidth: minusWidth);
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
  void _initBoxes({double minusWidth = 0, double minusHeight = 0}) {
    // if initialized => return
    if (_initialized) return;

    _screenWidth = AppSize.screenWidth - minusWidth;
    _screenHeight = AppSize.screenHeight - minusHeight;

    for (int i = 0; i < _boxCount; i++) {
      _boxes.add(
        _Box(
          x: _random.nextDouble(0.8) * _screenWidth,
          y: _random.nextDouble(0.8) * _screenHeight,
          dx: _random.nextDouble(1) * 2,
          dy: _random.nextDouble(1) * 2,
          angle: _random.nextDouble(1) * 2,
          rotationSpeed: (_random.nextDouble(1) - 0.5) * 0.2,
          boxSize: _boxSize,
        ),
      );
    }
    _initialized = true;
  }

  // box update
  void updateBoxes() {
    // if initialized => return
    if (!_initialized) {
      return;
    }
    for (var box in _boxes) {
      box.x += box.dx;
      box.y += box.dy;
      box.angle += box.rotationSpeed;

      if (box.x <= 0 || box.x + _boxSize >= _screenWidth) {
        box.dx = -box.dx;
      }
      if (box.y <= 0 || box.y + _boxSize >= _screenHeight) {
        box.dy = -box.dy;
      }
    }
  }
}

// box class
class _Box {
  double x; // from left location
  double y; // from top location
  double dx; // Horizontal movement distance
  double dy; // Vertical movement distance
  double angle; // Current rotation angle of the box
  final double rotationSpeed; // Rotation speed of the box
  final double boxSize; // Size of the box

  _Box({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.angle,
    required this.rotationSpeed,
    required this.boxSize,
  });
}
