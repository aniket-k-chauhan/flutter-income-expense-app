import 'package:flutter/material.dart';
import 'package:income_expense_app/features/account/screens/verification_code_screen.dart';
import 'package:income_expense_app/features/splash/screens/splash_screen.dart';
import 'package:income_expense_app/routes/route_generator.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Income Expense App",
      theme: ThemeData(fontFamily: "Poppins"),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const VerificationCodeScreen(),
    );
  }
}
