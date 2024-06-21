import 'package:flutter/material.dart';
import 'package:safeschool_admin/Widgets/reviewed_report_card.dart';

class Reviewed extends StatelessWidget {
  const Reviewed({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReviewedReportCard(
              reportName: "Verbal Bullying",
              schoolName: "Sharpie School",
              date: "05/06/24",
              dateReviewed: "20/06/24",
              status: false,
            ),
            ReviewedReportCard(
              reportName: "Verbal Bullying",
              schoolName: "Sharpie School",
              date: "05/06/24",
              dateReviewed: '11/08/24',
              status: true,
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
