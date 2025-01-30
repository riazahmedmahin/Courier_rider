import 'dart:math';

import 'package:app/presentation/ui/screens/welcome_screen.dart';
import 'package:app/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    _controller.forward().whenComplete(() {
      moveToNextScreen();
    });
  }

  void moveToNextScreen() {
    Get.offAll(WelcomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Stack(
          children: [
            // Background Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primaryColor.withOpacity(0.8),
                    AppColors.primaryColor.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ],
                ),
              ),
            ),

            // Animated Logo and Text
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with a subtle shadow
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Image.network(
                        "https://cdn-icons-png.flaticon.com/128/18409/18409099.png",
                        color: Colors.white,
                        height: 120,
                        width: 120,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Text with a gradient effect
                    ShaderMask(
                      shaderCallback: (bounds) {
                        return LinearGradient(
                          colors: [Colors.white, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Rid",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            WidgetSpan(
                              child: Transform.translate(
                                offset: Offset(0, 7),
                                child: Transform.rotate(
                                  angle: 0.2, // Slight rotation for "e"
                                  child: Text(
                                    "e",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            TextSpan(
                              text: "o",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Subtle animated particles in the background
            Positioned.fill(
              child: IgnorePointer(
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return CustomPaint(
                      painter: ParticlePainter(
                        animationValue: _controller.value,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
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

// Custom painter for animated particles
class ParticlePainter extends CustomPainter {
  final double animationValue;

  ParticlePainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final rng = Random(DateTime.now().millisecondsSinceEpoch);
    for (int i = 0; i < 50; i++) {
      final x = rng.nextDouble() * size.width;
      final y = rng.nextDouble() * size.height;
      final radius = rng.nextDouble() * 3 + 1;
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}