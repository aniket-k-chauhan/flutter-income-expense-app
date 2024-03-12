import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:income_expense_app/constants/global_variables.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName = "/account-screen";
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/app_icon.png",
                height: 250,
              ),
              const Text(
                "Let's get started",
                style: TextStyle(
                  fontSize: 26,
                  color: GlobalVariables.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
