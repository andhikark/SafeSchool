import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';

class ReportCard extends StatelessWidget {
  final String reportName;
  final String schoolName;
  final String date;
  const ReportCard(
      {super.key,
      required this.reportName,
      required this.schoolName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/report_incident');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 350,
              decoration: BoxDecoration(
                  color: ColorsUse.secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: -2,
                      blurRadius: 5,
                      offset: const Offset(0, 8),
                    )
                  ]),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reportName,
                        style: TextUse.heading_3().merge(
                            const TextStyle(color: ColorsUse.primaryColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 140.0),
                        child: Text(
                          date,
                          style: TextUse.heading_3().merge(const TextStyle(
                              color: ColorsUse.primaryColor, fontSize: 12)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    schoolName,
                    style: TextUse.heading_3().merge(const TextStyle(
                      fontSize: 12,
                      color: ColorsUse.accentColor,
                    )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
