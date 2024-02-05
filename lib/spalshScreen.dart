import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:VIIT_CONNECTS/landing.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController imageController;
  late AnimationController textController;

  @override
  void initState() {
    super.initState();

    imageController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Adjust the duration as needed
    );
    textController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    // Add listeners to trigger animations when the frame is built
    SchedulerBinding.instance?.addPostFrameCallback((_) {
      imageController.forward();
      textController.forward();
    });

    // Replace this with your navigation logic after the animation
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFDD000000),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: imageController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, -50 * (1 - imageController.value)), // Reduce the initial offset
                    child: child,
                  );
                },
                child: Image.asset(
                  'assets/images/VIITLOGO.png',
                  height: 225,
                  width: 301,
                ),
              ),
              AnimatedBuilder(
                animation: textController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0.0, 50 * (1 - textController.value)), // Reduce the initial offset
                    child: child,
                  );
                },
                child: Text(
                  "VIIT",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    imageController.dispose();
    textController.dispose();
    super.dispose();
  }
}
