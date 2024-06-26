import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Widgets/bottom_navbar.dart';
// import 'package:safeschool_admin/components/reject_message_confirm_popup.dart';
import 'package:safeschool_admin/pages/report_details.dart';
// import 'package:safeschool_admin/components/report_approved_success_popup.dart';
// import 'package:safeschool_admin/components/rejected_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        '/report_details_NR': (context) => ReportDetails(
              showButtons: true,
              reportId: 0,
            ),
        '/report_details_R': (context) => ReportDetails(
              showButtons: false,
              reportId: 0,
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/report_details') {
          final args = settings.arguments;
          if (args is int) {
            return MaterialPageRoute(
              builder: (context) => ReportDetails(
                showButtons:
                    true, // You can set this based on your requirements
                reportId: args, // Use args to set reportId
              ),
            );
          }
        } else if (settings.name == '/report_details_Reviewed') {
          final args = settings.arguments;
          if (args is int) {
            return MaterialPageRoute(
              builder: (context) => ReportDetails(
                showButtons:
                    false, // You can set this based on your requirements
                reportId: args, // Use args to set reportId
              ),
            );
          }
        }
        // Handle other routes here if needed
        return null;
      },
      home: const BottomNavbar(),
    );
  }
}
