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
              ElevatedButton(
                onPressed: () {
                  showCountryPicker(
                    context: context,
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      print('Select country: ${country.flagEmoji}');
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                      // Optional. Styles the text in the search field
                      searchTextStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                child: const Text('Show country picker'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
