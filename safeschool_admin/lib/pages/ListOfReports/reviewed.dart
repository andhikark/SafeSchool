import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:safeschool_admin/Widgets/reviewed_report_card.dart';

class Reviewed extends StatefulWidget {
  const Reviewed({Key? key}) : super(key: key);

  @override
  State<Reviewed> createState() => _ReviewedState();
}

class _ReviewedState extends State<Reviewed> {
  late Future<List<Report>> futureReports;

  @override
  void initState() {
    super.initState();
    futureReports = fetchReports();
  }

  Future<List<Report>> fetchReports() async {
    try {
      final response =
          await Dio().get('http://10.0.2.2:8080/report/reportReviewed');
      if (response.data['success']) {
        List<dynamic> data = response.data['payload'];
        // Limit to a maximum of 10 reports
        List<dynamic> limitedData =
            data.length > 18 ? data.sublist(0, 18) : data;
        return limitedData.map((item) => Report.fromJson(item)).toList();
      } else {
        throw Exception('Failed to fetch reports');
      }
    } catch (e) {
      throw Exception('Failed to load reports: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Report>>(
        future: futureReports,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: snapshot.data!.map((report) {
                  return ReviewedReportCard(
                    reportId: report.reportId,
                    reportName: mapBullyingType(report.typeOfBullying),
                    schoolName: report.schoolName,
                    date: _formatDate(report.dateOfIncident),
                    status: report.status == 'approved',
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  String _formatDate(String dateString) {
    // Example format conversion, adjust as per your date format
    DateTime parsedDate = DateTime.parse(dateString);
    return "${parsedDate.day}/${parsedDate.month}/${parsedDate.year}";
  }

  String mapBullyingType(String type) {
    switch (type) {
      case 'physical':
        return 'Physical Bullying';
      case 'verbal':
        return 'Verbal Bullying';
      case 'cyber':
        return 'Cyber Bullying';
      case 'sexual_harassment':
        return 'Sexual Harassment';
      default:
        return 'Unknown Bullying';
    }
  }
}

class Report {
  final int reportId;
  final String dateOfIncident;
  final String schoolName;
  final String province;
  final String gradeLevel;
  final String typeOfBullying;
  final String whatHappened;
  final String status;
  final String region;
  final String createdAt;
  final String picture;

  Report({
    required this.reportId,
    required this.dateOfIncident,
    required this.schoolName,
    required this.province,
    required this.gradeLevel,
    required this.typeOfBullying,
    required this.whatHappened,
    required this.status,
    required this.region,
    required this.createdAt,
    required this.picture,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      reportId: json['reportId'],
      dateOfIncident: json['dateOfIncident'],
      schoolName: json['schoolName'],
      province: json['province'],
      gradeLevel: json['gradeLevel'],
      typeOfBullying: json['typeOfBullying'],
      whatHappened: json['whatHappened'],
      status: json['status'],
      region: json['region'],
      createdAt: json['created_at'],
      picture: json['picture'],
    );
  }
}
