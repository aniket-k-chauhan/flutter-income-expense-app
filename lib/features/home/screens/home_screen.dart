import 'package:flutter/material.dart';
import 'package:income_expense_app/constants/global_variables.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  List<DateTime> getStartAndEndDateOfTheWeek(DateTime date) {
    DateTime startDate = date.subtract(Duration(days: date.weekday - 1));
    DateTime endDate =
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday));
    return [startDate, endDate];
  }

  String getAbrMonthFromIntValue(int month) {
    return DateFormat.MMM().format(DateTime(0, month));
  }

  @override
  Widget build(BuildContext context) {
    final [startDate, endDate] = getStartAndEndDateOfTheWeek(DateTime.now());
    final startAndEndDateStr = startDate.month == endDate.month
        ? "${startDate.day} - ${endDate.day} ${getAbrMonthFromIntValue(startDate.month)}"
        : "${startDate.day} ${getAbrMonthFromIntValue(startDate.month)} - ${endDate.day} ${getAbrMonthFromIntValue(endDate.month)}";

    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              // Welcome
              const WelcomeUser(),

              const SizedBox(height: 20),

              // Card
              const BalanceCard(),

              const SizedBox(height: 20),

              // Date Range
              DateRangeRow(startAndEndDateStr: startAndEndDateStr),

              const SizedBox(height: 20),

              // template or list
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/smiley_sticker.png",
                      width: 122,
                      height: 122,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Use ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: GlobalVariables.textPrimary,
                          ),
                        ),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: GlobalVariables.textPrimary,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            color: GlobalVariables.textPrimary,
                          ),
                        ),
                        const Text(
                          " button",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: GlobalVariables.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "to add your income. expense",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: GlobalVariables.textGreyColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 75,
        height: 75,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            elevation: 0,
            child: Container(
              width: 75,
              height: 75,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: GlobalVariables.gradientColors,
                    stops: [0.2, 0.6, 0.8],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
              child: const Icon(
                Icons.add_rounded,
                size: 28,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 70,
                  color: Color.fromRGBO(0, 0, 0, 0.08),
                  offset: Offset(0, -20))
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: 30,
            selectedItemColor: GlobalVariables.textPrimary,
            unselectedItemColor: const Color.fromRGBO(161, 178, 200, 1),
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_rounded),
              ),
              BottomNavigationBarItem(
                label: "Analytics",
                icon: Icon(Icons.analytics_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateRangeRow extends StatelessWidget {
  const DateRangeRow({
    super.key,
    required this.startAndEndDateStr,
  });

  final String startAndEndDateStr;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          child: const Center(
            child: Icon(
              Icons.chevron_left_rounded,
              size: 36,
              color: GlobalVariables.textPrimary,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Text(
            startAndEndDateStr,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: GlobalVariables.textPrimary,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {},
          child: const Center(
            child: Icon(
              Icons.chevron_right_rounded,
              size: 36,
              color: GlobalVariables.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            "AC",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
                fontSize: 16,
                color: GlobalVariables.textGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Aniket Chauhan",
              style: TextStyle(
                fontSize: 22,
                color: GlobalVariables.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Balance",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: GlobalVariables.textLightPrimary,
                  ),
                ),
                Text(
                  "\$0",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    color: GlobalVariables.textPrimary,
                  ),
                ),
                IncomeExpenceValue(
                  type: "Income",
                  icon: Icons.arrow_upward_rounded,
                  iconColor: Color.fromRGBO(98, 186, 113, 1),
                  value: '0',
                ),
                IncomeExpenceValue(
                  type: "Expence",
                  icon: Icons.arrow_downward_rounded,
                  iconColor: Color.fromRGBO(228, 83, 88, 1),
                  value: '0',
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              "assets/images/card_chart.png",
              width: 119,
              height: 119,
            ),
          ),
        ],
      ),
    );
  }
}

class IncomeExpenceValue extends StatelessWidget {
  final String type;
  final IconData icon;
  final Color iconColor;
  final String value;

  const IncomeExpenceValue({
    super.key,
    required this.type,
    required this.iconColor,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: GlobalVariables.backgroundColor,
          child: Icon(
            size: 16,
            weight: 2,
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: GlobalVariables.textLightPrimary,
              ),
            ),
            Text(
              "\$$value",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: GlobalVariables.textPrimary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
