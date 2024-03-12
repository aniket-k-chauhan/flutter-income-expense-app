import 'package:flutter/material.dart';
import 'package:income_expense_app/constants/global_variables.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: Center(
        child: Text("H O M E  P A G E"),
      ),
    );
  }
}
