import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class Resources extends StatelessWidget {
  const Resources({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Resources',
            style:
                TextUse.heading_1().copyWith(color: ColorsUse.secondaryColor),
          ),
        ),
        backgroundColor: ColorsUse.primaryColor,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Container(),
    );
  }
}
