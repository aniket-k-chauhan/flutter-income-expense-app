import 'dart:convert';
import 'dart:developer';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:income_expense_app/constants/global_variables.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  Currency? _currency;

  @override
  void initState() {
    super.initState();
    _currency = Currency.from(json: {
      "code": "USD",
      "name": "United States Dollar",
      "symbol": "\$",
      "number": 840,
      "flag": "USD",
      "decimal_digits": 2,
      "name_plural": "US dollars",
      "symbol_on_left": true,
      "decimal_separator": ".",
      "thousands_separator": ",",
      "space_between_amount_and_symbol": false,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(254, 255, 254, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Create Profile",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(43, 64, 91, 1),
                  ),
                ),

                const SizedBox(height: 40),

                // cicle avatar
                Ink(
                  width: 124,
                  height: 124,
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(62),
                    child: const CircleAvatar(
                      backgroundColor: Color.fromRGBO(243, 244, 248, 1),
                      child: Icon(
                        Icons.person_2_rounded,
                        size: 60,
                        color: Color.fromRGBO(198, 197, 209, 1),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // currency picker
                Row(
                  children: [
                    Ink(
                      height: 65,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 244, 248, 1),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: InkWell(
                        onTap: () {
                          showCurrencyPicker(
                            context: context,
                            onSelect: (Currency currency) {
                              setState(() {
                                _currency = currency;
                              });
                            },
                          );
                        },
                        borderRadius: BorderRadius.circular(18),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _currency!.symbol,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromRGBO(43, 64, 91, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Color.fromRGBO(43, 64, 91, 1),
                                size: 26,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // Continue button
                Ink(
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: GlobalVariables.gradientColors,
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(18),
                    child: const Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
