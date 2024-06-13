import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Widgets/bottom_navbar.dart';
//import 'package:safeschool/Widgets/bottom_navbar.dart';
//import 'package:safeschool/Utilities/text_use.dart';
//import 'package:safeschool/components/text_form_fields.dart';
//mport 'package:safeschool/components/date_form_fields.dart';
//import 'package:safeschool/components/long_text_form_field.dart';
//import 'package:safeschool/components/review_report_msg.dart';
//import 'package:safeschool/components/report_success_popup.dart';
//import 'package:safeschool/registrations/sign_in_page.dart';
import 'package:safeschool/components/report_success_popup.dart';
import 'package:safeschool/pages/bullying_types/physical.dart';
import 'package:safeschool/pages/bullying_types/verbal.dart';
import 'package:safeschool/pages/bullying_types/cyber.dart';
import 'package:safeschool/pages/bullying_types/sexual_h.dart';
import 'package:safeschool/pages/help.dart';
import 'package:safeschool/pages/home.dart';
import 'package:safeschool/pages/home_page.dart';
import 'package:safeschool/registrations/register_page.dart';
import 'package:safeschool/pages/report_incident.dart';

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
      routes: {
        '/bullying_types/physical': (context) => const Physical(),
        '/bullying_types/verbal': (context) => const Verbal(),
        '/bullying_types/cyber': (context) => const Cyber(),
        '/bullying_types/sexual_h': (context) => const SexualH(),
      },
      home: const BottomNavbar(),
    );
  }
}
