import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/components/buttons.dart';

class ReportDetails extends StatefulWidget {
  const ReportDetails({super.key});

  @override
  State<ReportDetails> createState() => _ReportDetailsState();
}

class _ReportDetailsState extends State<ReportDetails> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController provinceDropDownController = TextEditingController();
  final TextEditingController gradeLevelController = TextEditingController();
  final TextEditingController typeOfBullyingController = TextEditingController();
  final TextEditingController longTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with mock-up information
    dateController.text = '05/06/2024';
    schoolNameController.text = 'Sharpie Institue of Technology';
    provinceDropDownController.text = 'Bangkok';
    gradeLevelController.text = 'Grade 10';
    typeOfBullyingController.text = 'Verbal Bullying';
    longTextController.text = 'Someone mocking me for having sigma skibidi rizz........';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Report Details',
            style: TextUse.heading_1().copyWith(color: ColorsUse.secondaryColor),
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
            _buildReadOnlyField('Type of Bullying', typeOfBullyingController.text),
            const SizedBox(height: 16),
            _buildReadOnlyField('Tell us what happened?', longTextController.text, isLongText: true),
            const SizedBox(height: 45),
            const Center(
              child: PrimaryButton(
                name: 'Approve Report',
                primary: ColorsUse.primaryColor,
                textColor: ColorsUse.backgroundColor,
                borderColor: false,
                // onPressed: () {
                //   // Define what happens when the button is pressed
                // },
              ),
            ),
            const SizedBox(height: 16),
            const PrimaryButton(
              name: "Reject Report",
              primary: ColorsUse.secondaryColor,
              textColor: ColorsUse.accentColor,
              borderColor: true,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildReadOnlyField(String description, String value, {bool isLongText = false}) {
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