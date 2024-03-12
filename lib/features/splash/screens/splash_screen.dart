import 'package:flutter/material.dart';
import 'package:income_expense_app/constants/global_variables.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: GlobalVariables.gradientColors,
                stops: [0.2, 0.5, 0.8],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(-0.9),
              ),
            ),
          ),
          Image.asset(
            "assets/images/splash_dots.png",
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height / 2,
            alignment: Alignment.topCenter,
          ),
          Center(
            child: Image.asset(
              "assets/images/app_icon_circle.png",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
