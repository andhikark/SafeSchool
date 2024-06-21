import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/components/popup_buttons.dart';
import 'package:safeschool_admin/components/rejected_popup.dart';

class RejectMessageConfirmPopup extends StatelessWidget {
  const RejectMessageConfirmPopup({super.key});

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
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RejectedPopup();
                          },
                        );
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
