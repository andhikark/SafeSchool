import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';

class ReviewedReportCard extends StatelessWidget {
  final String reportName;
  final String schoolName;
  final String date;
  final bool status;
  final int reportId;

  const ReviewedReportCard(
      {Key? key,
      required this.reportName,
      required this.schoolName,
      required this.date,
      required this.status,
      required this.reportId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/report_details_Reviewed',
            arguments: reportId);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Stack(
          children: [
            Container(
              height: 130,
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
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reportName,
                    style: TextUse.heading_3().merge(
                      const TextStyle(color: ColorsUse.primaryColor),
                    ),
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
                  ),
                  const SizedBox(height: 15),
                  ReviewStatus(status: status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewStatus extends StatelessWidget {
  final bool status;

  const ReviewStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor =
        status ? ColorsUse.primaryColor : const Color(0xff8C1F1F);
    String statusName = status ? "Approved" : "Rejected";

    return Container(
      height: 25,
      width: 90,
      color: statusColor,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Text(
          statusName,
          style: TextUse.heading_3().merge(
            const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
