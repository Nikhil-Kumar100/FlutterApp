import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _loadDataAndNavigate();
  }

  Future<void> _loadDataAndNavigate() async {
    await Future.delayed(Duration(seconds: 2)); // Delay for 2 seconds

    // Determine the initial route dynamically based on user authentication status
    String initialRoute =
        (FirebaseAuth.instance.currentUser != null) ? "/home" : "/login";

    Navigator.pushReplacementNamed(
        context, initialRoute); // Navigate to the appropriate route
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: FlingingBirdPainter(_controller.value),
                size: Size(350, 350),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
// Make sure to import the correct color file

class FlingingBirdPainter extends CustomPainter {
  final double animationValue;

  FlingingBirdPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 4;
    final offset = radius * 0.8;
    final double angle = animationValue * math.pi * 2;

    final path = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius))
      ..moveTo(center.dx + offset * math.cos(angle),
          center.dy + offset * math.sin(angle))
      ..lineTo(center.dx - offset * math.cos(angle),
          center.dy - offset * math.sin(angle));

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'TechProHelpline',
        style: TextStyle(
          color: AppColors.textColor,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    final textOffset = Offset(center.dx - textPainter.width / 2,
        center.dy + radius + 10); // Adjust the position as needed

    final paint = Paint()
      ..color = AppColors.lodingpagecircul
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0;

    canvas.drawPath(path, paint);
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
