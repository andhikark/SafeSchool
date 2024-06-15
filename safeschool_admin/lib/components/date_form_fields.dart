import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class CustomDateFormField extends StatefulWidget {
  final String description;
  final String placeholder;
  final TextEditingController controller;
  final Color descriptionColor;
  final TextStyle descriptionTextStyle;

  const CustomDateFormField({
    Key? key,
    required this.description,
    required this.placeholder,
    required this.controller,
    this.descriptionColor = Colors.black,
    required this.descriptionTextStyle,
  }) : super(key: key);

  @override
  _CustomDateFormFieldState createState() => _CustomDateFormFieldState();
}

class _CustomDateFormFieldState extends State<CustomDateFormField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsUse.primaryColor, // Header background color
              onPrimary: ColorsUse.secondaryColor, // Header text color
              surface: ColorsUse.backgroundColor, // Calendar background color
              onSurface: ColorsUse.accentColor, // Calendar text color
            ),
            dialogBackgroundColor: ColorsUse.secondaryColor, // Background color
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        widget.controller.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.description,
          style: widget.descriptionTextStyle
              .copyWith(color: widget.descriptionColor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: widget.placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            filled: true,
            fillColor: ColorsUse.secondaryColor,
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          style: const TextStyle(
              color: ColorsUse.accentColor), // Set the text color here
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
