import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/components/buttons.dart';
import 'package:safeschool_admin/components/reject_message_confirm_popup.dart';
import 'package:safeschool_admin/components/report_approved_success_popup.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReportDetails extends StatefulWidget {
  final bool showButtons;
  final int reportId;

  const ReportDetails({
    Key? key,
    required this.showButtons,
    required this.reportId,
  }) : super(key: key);

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController provinceDropDownController =
      TextEditingController();
  final TextEditingController gradeLevelController = TextEditingController();
  final TextEditingController typeOfBullyingController =
      TextEditingController();
  final TextEditingController longTextController = TextEditingController();

  late String imageUrl = "";

  late Map<String, dynamic> reportData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final dio = Dio();
    final url = 'http://10.0.2.2:8080/report/reportById/${widget.reportId}';

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final jsonResponse = response.data;
        setState(() {
          reportData = jsonResponse['payload'];
          // Update controllers with fetched data
          dateController.text = _formatDate(reportData['dateOfIncident']);
          schoolNameController.text = reportData['schoolName'];
          provinceDropDownController.text = reportData['province'];
          gradeLevelController.text = reportData['gradeLevel'];
          typeOfBullyingController.text = reportData['typeOfBullying'];
          longTextController.text = reportData['whatHappened'];
          imageUrl = reportData['picture'];
        });
      } else {
        throw Exception('Failed to load report details');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  String _formatDate(String? dateString) {
    if (dateString != null) {
      try {
        final parsedDate = DateTime.parse(dateString);
        return DateFormat('yyyy-MM-dd').format(parsedDate);
      } catch (e) {
        print('Error parsing date: $e');
      }
    }
    return 'Invalid Date'; // Default value or placeholder for invalid date
  }

  Future<void> updateReportStatus(String status) async {
    final dio = Dio();
    final url =
        'http://10.0.2.2:8080/report/updateReport$status/${widget.reportId}';

    print(widget.reportId);
    try {
      final response = await dio.patch(url);
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ReportApprovedSuccessPopup(); // Show success dialog
          },
        );
      } else {
        throw Exception('Failed to update report status');
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to update report status: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Report Details',
            style:
                TextUse.heading_1().copyWith(color: ColorsUse.secondaryColor),
          ),
        ),
        backgroundColor: ColorsUse.primaryColor,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReadOnlyField('Date of Incident', dateController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField('School Name', schoolNameController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField('Province', provinceDropDownController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField('Grade Level', gradeLevelController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField(
                'Type of Bullying', typeOfBullyingController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField(
                'Tell us what happened?', longTextController.text,
                isLongText: true),
            const SizedBox(height: 16),
            if (imageUrl.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Image',
                    style: TextUse.heading_2()
                        .copyWith(color: ColorsUse.accentColor),
                  ),
                  const SizedBox(height: 8),
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            const SizedBox(height: 45),
            if (widget.showButtons) ...[
              Center(
                child: PrimaryButton(
                  name: 'Approve Report',
                  primary: ColorsUse.primaryColor,
                  textColor: ColorsUse.backgroundColor,
                  borderColor: false,
                  onPressed: () {
                    updateReportStatus('Approved');
                  },
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                name: 'Reject Report',
                primary: ColorsUse.secondaryColor,
                textColor: ColorsUse.accentColor,
                borderColor: true,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RejectMessageConfirmPopup(
                          reportId: widget.reportId);
                    },
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String description, String value,
      {bool isLongText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            value,
            style: TextUse.heading_3().copyWith(color: Colors.grey[700]),
            maxLines: isLongText ? null : 1,
            overflow: isLongText ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
