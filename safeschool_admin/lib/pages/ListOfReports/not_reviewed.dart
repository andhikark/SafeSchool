import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/Widgets/report_card.dart';

class NotReviewed extends StatelessWidget {
  const NotReviewed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReportCard(
              reportName: "Verbal Bullying",
              schoolName: "Sharpie School",
              date: "05/06/24")
        ],
      ),
    );
  }
}
