import 'package:flutter/material.dart';

class ShaderCanvas extends StatefulWidget {
  const ShaderCanvas({super.key});

  @override
  ShaderCanvasState createState() => ShaderCanvasState();
}

class ShaderCanvasState extends State<ShaderCanvas> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: ShaderCanvasPainter(_controller.value),
          child: Container(), // Empty container to apply as a background.
        );
      },
    );
  }
}

class ShaderCanvasPainter extends CustomPainter {
  final double animationValue;

  ShaderCanvasPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..shader = _createShader(size, animationValue);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  Shader _createShader(Size size, double animationValue) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.blueGrey.withOpacity(0.5),
        Colors.indigo.withOpacity(0.4),
        Colors.deepPurple.withOpacity(0.5),
        Colors.lightBlueAccent.withOpacity(0.4),
      ],
      stops: [
        (animationValue - 0.3).clamp(0.0, 1.0),
        animationValue.clamp(0.0, 1.0),
        (animationValue + 0.3).clamp(0.0, 1.0),
        (animationValue + 0.6).clamp(0.0, 1.0),
      ],
    ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
  }

  @override
  bool shouldRepaint(ShaderCanvasPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
