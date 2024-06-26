import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/date_form_fields.dart';
import 'package:safeschool/components/text_form_fields.dart';
import 'package:safeschool/components/long_text_form_field.dart';
import 'package:safeschool/components/buttons.dart';
import 'package:safeschool/Widgets/add_image.dart';
import 'package:safeschool/components/review_report_msg.dart';

class ReportIncident extends StatefulWidget {
  const ReportIncident({super.key});

  @override
  State<ReportIncident> createState() => _ReportIncidentState();
}

class _ReportIncidentState extends State<ReportIncident> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController provinceDropDownController =
      TextEditingController();
  final TextEditingController gradeLevelController = TextEditingController();
  final TextEditingController typeOfBullyingController =
      TextEditingController();
  final TextEditingController longTextController = TextEditingController();
  File? _selectedImage;

  Dio dio = Dio();

  String mapDropdownItem(String item) {
    switch (item) {
      case 'Physical Bullying':
        return 'physical';
      case 'Sexual Bullying':
        return 'sexual_harassment';
      case 'Verbal Bullying':
        return 'verbal';
      case 'Cyberbullying':
        return 'cyber';
      default:
        return item;
    }
  }

  void _reviewReport() {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateController.text);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    String formattedProvince =
        provinceDropDownController.text.replaceAll(' ', '_');
    List<String> parts = gradeLevelController.text.split(' ');
    String formattedGrade = '${parts[0].toLowerCase()}_${parts[1]}';
    String formattedTypeOfBullying =
        mapDropdownItem(typeOfBullyingController.text);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ReviewPopup(
          date: formattedDate,
          schoolName: schoolNameController.text,
          province: formattedProvince,
          gradeLevel: formattedGrade,
          typeOfBullying: formattedTypeOfBullying,
          description: longTextController.text,
          image: _selectedImage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Report Incident',
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
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDateFormField(
                description: 'Date of Incident',
                placeholder: 'dd/mm/yyyy',
                controller: dateController,
                descriptionTextStyle: TextUse.heading_2(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                description: 'School Name',
                placeholder: 'Enter Your School Name',
                controller: schoolNameController,
                descriptionTextStyle:
                    TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                description: 'Province',
                placeholder: 'Select Your Province',
                controller: provinceDropDownController,
                descriptionTextStyle:
                    TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
                dropdownItems: const [
                  'Bangkok',
                  'Amnat Charoen',
                  'Ang Thong',
                  'Bueng Kan',
                  'Buriram',
                  'Chachoengsao',
                  'Chai Nat',
                  'Chaiyaphum',
                  'Chanthaburi',
                  'Chiang Mai',
                  'Chiang Rai',
                  'Chonburi',
                  'Chumphon',
                  'Kalasin',
                  'Kamphaeng Phet',
                  'Kanchanaburi',
                  'Khon Kaen',
                  'Krabi',
                  'Lampang',
                  'Lamphun',
                  'Loei',
                  'Lopburi',
                  'Mae Hong Son',
                  'Mukdahan',
                  'Nakhon Nayok',
                  'Nakhon Pathom',
                  'Nakhon Phanom',
                  'Nakhon Ratchasima',
                  'Nakhon Sawan',
                  'Nakhon Si Thammarat',
                  'Nan',
                  'Narathiwat',
                  'Nong Bua Lamphu',
                  'Nong Khai',
                  'Nonthaburi',
                  'Pathum Thani',
                  'Pattani',
                  'Phang Nga',
                  'Phathalung',
                  'Phayao',
                  'Phetchabun',
                  'Phetchaburi',
                  'Phichit',
                  'Phitsanulok',
                  'Phra Nakhon Si Ayutthaya',
                  'Phrae',
                  'Phuket',
                  'Prachinburi',
                  'Prachuap Khiri Khan',
                  'Ranong',
                  'Ratchaburi',
                  'Rayong',
                  'Roi Et',
                  'Sa Kaeo',
                  'Sakon Nakhon',
                  'Samut Prakan',
                  'Samut Sakhon',
                  'Samut Songkhram',
                  'Saraburi',
                  'Satun',
                  'Sing Buri',
                  'Sisaket',
                  'Songkhla',
                  'Sukhothai',
                  'Suphan Buri',
                  'Surat Thani',
                  'Surin',
                  'Tak',
                  'Trang',
                  'Trat',
                  'Ubon Ratchathani',
                  'Udon Thani',
                  'Uthai Thani',
                  'Uttaradit',
                  'Yala',
                  'Yasothon',
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                description: 'Grade Level',
                placeholder: 'Select Your Grade Level',
                controller: gradeLevelController,
                descriptionTextStyle:
                    TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
                dropdownItems: const [
                  'Grade 7',
                  'Grade 8',
                  'Grade 9',
                  'Grade 10',
                  'Grade 11',
                  'Grade 12'
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                description: 'Type of Bullying',
                placeholder: 'Select the Type of Bullying',
                controller: typeOfBullyingController,
                descriptionTextStyle:
                    TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
                dropdownItems: const [
                  'Physical Bullying',
                  'Sexual Bullying',
                  'Verbal Bullying',
                  'Cyberbullying',
                ],
              ),
              const SizedBox(height: 16),
              CustomLongTextFormField(
                description: 'Tell us what happened?',
                placeholder:
                    'Tell Us What Happened. The More Details You Provide, The Better We Can Help.',
                controller: longTextController,
                descriptionTextStyle:
                    TextUse.heading_2().copyWith(color: ColorsUse.accentColor),
                inputTextStyle:
                    TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              RichText(
                text: TextSpan(
                    style: TextUse.heading_2().merge(const TextStyle(
                        color: ColorsUse.accentColor, fontFamily: "Rubik")),
                    children: const [
                      TextSpan(text: "Attach Evidence"),
                      TextSpan(
                          text: "  (optional)",
                          style: TextStyle(fontSize: 14, color: Colors.black54))
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: AddImage(
                  onImageSelected: (image) {
                    if (image != null) {
                      setState(() {
                        _selectedImage = image;
                      });
                    }
                  },
                  textfill: 'Add image + ',
                ),
              ),
              Center(
                child: PrimaryButton(
                  name: 'Confirm',
                  primary: ColorsUse.primaryColor,
                  textColor: ColorsUse.backgroundColor,
                  borderColor: false,
                  onTap: _reviewReport,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
