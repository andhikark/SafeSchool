import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class CustomTextFormField extends StatelessWidget {
  final String description;
  final String placeholder;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController controller;
  final Color descriptionColor;
  final TextStyle descriptionTextStyle;
  final List<String>? dropdownItems; // Changed to List<String>
  final TextStyle inputTextStyle;

  const CustomTextFormField({
    Key? key,
    required this.description,
    required this.placeholder,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.descriptionColor = Colors.black,
    required this.descriptionTextStyle,
    this.dropdownItems,
    this.inputTextStyle = const TextStyle(color: Colors.black),
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
        dropdownItems == null
            ? TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: placeholder,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true, // Enable filling the background
                  fillColor: ColorsUse.secondaryColor, // Set the fill color
                ),
                style: inputTextStyle,
              )
            : DropdownButtonFormField<String>(
                value: controller.text.isNotEmpty ? controller.text : null,
                items: dropdownItems!
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  controller.text = newValue!;
                },
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
