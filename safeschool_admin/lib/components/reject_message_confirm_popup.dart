import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/components/popup_buttons.dart';
import 'package:safeschool_admin/components/rejected_popup.dart';
import 'package:dio/dio.dart';

class RejectMessageConfirmPopup extends StatefulWidget {
  final int reportId;

  const RejectMessageConfirmPopup({
    Key? key,
    required this.reportId,
  }) : super(key: key);

  @override
  State<RejectMessageConfirmPopup> createState() =>
      _RejectMessageConfirmPopupState();
}

class _RejectMessageConfirmPopupState extends State<RejectMessageConfirmPopup> {
  Future<void> updateReportStatus() async {
    final dio = Dio();
    final url =
        'http://153.92.4.54:8080/report/updateReportRejected/${widget.reportId}';

    try {
      final response = await dio.patch(url);
      if (response.statusCode == 200) {
        Navigator.of(context).pop(); // Close rejection confirmation dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const RejectedPopup(); // Show rejection success dialog
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
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(98, 12, 17, 4),
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
            border: Border.all(
              color: ColorsUse.accentColor,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.close, color: ColorsUse.accentColor),
                ),
              ),
              Text(
                "Do you want to reject the report?",
                textAlign: TextAlign.center,
                style:
                    TextUse.heading_2().copyWith(color: ColorsUse.primaryColor),
              ),
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SecondaryButton(
                      name: "Yes",
                      primary: ColorsUse.accentColor,
                      textColor: ColorsUse.secondaryColor,
                      onPressed: () {
                        updateReportStatus();
                      },
                    ),
                    const SizedBox(height: 10),
                    SecondaryButton(
                      name: "No",
                      primary: ColorsUse.secondaryColor,
                      textColor: ColorsUse.accentColor,
                      borderColor: true,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
