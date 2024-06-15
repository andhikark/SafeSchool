import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class CustomLongTextFormField extends StatelessWidget {
  final String description;
  final String placeholder;
  final TextEditingController controller;
  final Color descriptionColor;
  final TextStyle descriptionTextStyle;
  final TextStyle inputTextStyle;
  final int maxLength;

  const CustomLongTextFormField({
    Key? key,
    required this.description,
    required this.placeholder,
    required this.controller,
    this.descriptionColor = Colors.black,
    required this.descriptionTextStyle,
    this.inputTextStyle = const TextStyle(color: Colors.black),
    this.maxLength = 500,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: descriptionTextStyle.copyWith(color: descriptionColor),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          maxLength: maxLength,
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
            hintText: placeholder,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true, // Enable filling the background
            fillColor: ColorsUse.secondaryColor, // Set the fill color
          ),
          style: inputTextStyle,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
