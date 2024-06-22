import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';

class ReportCard extends StatelessWidget {
  final String reportName;
  final String schoolName;
  final String date;
  final int reportId;

  const ReportCard(
      {super.key,
      required this.reportName,
      required this.schoolName,
      required this.date,
      required this.reportId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/report_details', arguments: reportId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: double.infinity, // Adjust width to take full width
              decoration: BoxDecoration(
                color: ColorsUse.secondaryColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: -2,
                    blurRadius: 5,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          reportName,
                          style: TextUse.heading_3().merge(
                            const TextStyle(color: ColorsUse.primaryColor),
                          ),
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        date,
                        style: TextUse.heading_3().merge(
                          const TextStyle(
                            color: ColorsUse.primaryColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    schoolName,
                    style: TextUse.heading_3().merge(
                      const TextStyle(
                        fontSize: 12,
                        color: ColorsUse.accentColor,
                      ),
                    ),
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
