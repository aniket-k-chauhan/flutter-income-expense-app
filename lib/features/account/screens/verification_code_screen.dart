import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:income_expense_app/constants/global_variables.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatefulWidget {
  static const String routeName = "/verification-code-screen";
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
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
                // back button
                Align(
                  alignment: Alignment.topLeft,
                  child: Ink(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(243, 244, 248, 1),
                        borderRadius: BorderRadius.circular(14)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Color.fromRGBO(20, 8, 56, 1),
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Text(
                        "Verification Code",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(43, 64, 91, 1),
                        ),
                      ),
                      Text(
                        "We have sent the verification code to your mobile number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(42, 29, 75, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // pin code
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    textStyle: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 70,
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(8),
                      activeColor: const Color.fromRGBO(167, 119, 249, 1),
                      activeFillColor: const Color.fromRGBO(241, 234, 253, 1),
                      inactiveColor: const Color.fromRGBO(255, 119, 86, 0.27),
                      inactiveFillColor: Colors.white,
                      selectedColor: const Color.fromRGBO(70, 0, 120, 1),
                      errorBorderColor: const Color.fromRGBO(255, 81, 89, 1),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // resend code
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: null,
                    icon: const Text(
                      "(60)",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(42, 29, 75, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    label: const Text(
                      "Resend Code",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(42, 29, 75, 0.3),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Verify button
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
                    child: const Center(
                        child: Text(
                      "Verify",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
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
