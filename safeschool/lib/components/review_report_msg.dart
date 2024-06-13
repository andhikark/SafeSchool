import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/popup_buttons.dart';

class ReviewPopup extends StatelessWidget {
  const ReviewPopup({super.key});

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
                color: ColorsUse.accentColor,
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
                "Review Your Report",
                style:
                    TextUse.heading_1().copyWith(color: ColorsUse.primaryColor),
              ),
              const SizedBox(height: 3),
              Text(
                "Please review your report details for \naccuracy before submitting.",
                style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorsUse.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: ColorsUse.accentColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "05/06/24\nSharpie Institute of Technology, Bangkok\nGrade 10",
                      style: TextUse.heading_3().copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorsUse.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: ColorsUse.accentColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Verbal Bullying",
                      style: TextUse.heading_2().copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "I was walking to class during lunch break when "
                      "a group of students from another grade level started calling me "
                      "names and making fun of my clothes. They followed me for a while "
                      "and wouldn't leave me alone. I felt scared and embarrassed.",
                      style: TextUse.body()
                          .copyWith(color: ColorsUse.secondaryColor),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SecondaryButton(
                      name: "Submit Report",
                      primary: ColorsUse.accentColor,
                      textColor: ColorsUse.secondaryColor,
                    ),
                    SizedBox(height: 10),
                    SecondaryButton(
                      name: "Edit Information",
                      primary: ColorsUse.secondaryColor,
                      textColor: ColorsUse.accentColor,
                      borderColor: true,
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
