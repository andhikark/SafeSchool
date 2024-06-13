import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
//import 'package:safeschool/Utilities/text_use.dart';
//import 'package:safeschool/components/text_form_fields.dart';
//mport 'package:safeschool/components/date_form_fields.dart';
//import 'package:safeschool/components/long_text_form_field.dart';
//import 'package:safeschool/components/review_report_msg.dart';
import 'package:safeschool/components/report_success_popup.dart';
import 'package:safeschool/registrations/first_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController confirmPasswordController = TextEditingController();
  // final TextEditingController dateController = TextEditingController();
  // final TextEditingController gradeController = TextEditingController();
  final TextEditingController longTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeSchool',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsUse.primaryColor,
          brightness: Brightness.light,
          primary: ColorsUse.primaryColor,
          onPrimary: ColorsUse.secondaryColor,
          secondary: ColorsUse.secondaryColor,
          onSecondary: ColorsUse.accentColor,
          onSurface: ColorsUse.backgroundColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsUse.primaryColor,
        ),
        fontFamily: "Rubik",
      ),
      home: FirstPage(),
    );
  }
}
