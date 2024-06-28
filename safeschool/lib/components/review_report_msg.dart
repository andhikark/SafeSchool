import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/popup_buttons.dart';

class ReviewPopup extends StatelessWidget {
  final String date;
  final String schoolName;
  final String province;
  final String gradeLevel;
  final String typeOfBullying;
  final String description;
  final File? image;

  const ReviewPopup({
    Key? key,
    required this.date,
    required this.schoolName,
    required this.province,
    required this.gradeLevel,
    required this.typeOfBullying,
    required this.description,
    this.image,
  }) : super(key: key);

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
                      "$date\n$schoolName, ${province.replaceAll('_', ' ')}\n$gradeLevel",
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
                      typeOfBullying.replaceAll('_', ' '),
                      style: TextUse.heading_2().copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: TextUse.body()
                          .copyWith(color: ColorsUse.secondaryColor),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              if (image != null) Image.file(image!),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SecondaryButton(
                      name: "Submit Report",
                      primary: ColorsUse.accentColor,
                      textColor: ColorsUse.secondaryColor,
                      onTap: () async {
                        // Create FormData
                        FormData formData = FormData.fromMap({
                          'dateOfIncident': date,
                          'schoolName': schoolName,
                          'province': province,
                          'gradeLevel': gradeLevel,
                          'typeOfBullying': typeOfBullying,
                          'whatHappened': description,
                          'file': image != null
                              ? await MultipartFile.fromFile(image!.path,
                                  filename: image!.path.split('/').last)
                              : null,
                        });

                        try {
                          Response response = await Dio().post(
                            'http://10.0.2.2:8080/report/createReport',
                            data: formData,
                            options: Options(
                              headers: {
                                Headers.contentTypeHeader:
                                    'multipart/form-data',
                              },
                            ),
                          );

                          if (response.statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Incident reported successfully')),
                            );
                            Navigator.of(context)
                                .pop(); // Close the ReviewPopup
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to report incident')),
                            );
                          }
                        } catch (e) {
                          print('Error posting report: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Error: Failed to report incident')),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    SecondaryButton(
                      name: "Edit Information",
                      primary: ColorsUse.secondaryColor,
                      textColor: ColorsUse.accentColor,
                      borderColor: true,
                      onTap: () {
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
