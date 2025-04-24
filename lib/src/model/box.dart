// box class
class Box {
  double x; // from left location
  double y; // from top location
  double dx; // Horizontal movement distance
  double dy; // Vertical movement distance
  double angle; // Current rotation angle of the box
  final double rotationSpeed; // Rotation speed of the box

  Box({
    required this.x,
    required this.y,
    required this.dx,
    required this.dy,
    required this.angle,
    required this.rotationSpeed,
  });
}
