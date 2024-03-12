import 'package:flutter/material.dart';
import 'package:income_expense_app/features/account/screens/account_screen.dart';
import 'package:income_expense_app/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case AccountScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AccountScreen(),
      );
    default:
      return _defaultRoute();
  }
}

MaterialPageRoute<dynamic> _defaultRoute() {
  return MaterialPageRoute(
    builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text("No Route found."),
        ),
      );
    },
  );
}
