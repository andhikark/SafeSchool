import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/components/buttons.dart';
import 'package:safeschool/Utilities/text_use.dart'; // Make sure this file is correctly implemented

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 320,
              width: 320,
              child: Image.asset("assets/images/logo_fin.png"),
            ),
            const SizedBox(height: 20),
            Text(
              'Stand Up for Yourself & Others.',
              style:
                  TextUse.heading_3().copyWith(color: ColorsUse.primaryColor),
            ),
            const SizedBox(height: 80),
            PrimaryButton(
              name: 'Sign In',
              primary: ColorsUse.primaryColor,
              textColor: ColorsUse.backgroundColor,
              borderColor: false,
              onTap: () {
                Navigator.pushNamed(context, '/signin');
              },
            ),
            const SizedBox(height: 15),
            PrimaryButton(
              name: "Register",
              primary: ColorsUse.backgroundColor,
              textColor: ColorsUse.accentColor,
              borderColor: true,
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
