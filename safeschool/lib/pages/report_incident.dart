import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/date_form_fields.dart';
import 'package:safeschool/components/text_form_fields.dart';
import 'package:safeschool/components/long_text_form_field.dart';
import 'package:safeschool/components/buttons.dart';

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
                'Kampheng Phet',
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
                'Grade 1',
                'Grade 2',
                'Grade 3',
                'Grade 4',
                'Grade 5',
                'Grade 6',
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
                'Social Bullying',
                'Cyberbullying',
                'Racial bullying',
                'Academic bullying',
                'LGBTQ+ bullying',
                'Other',
              ],
            ),
            const SizedBox(height: 16),
            CustomLongTextFormField(
              description: 'Tell us what happened?',
              placeholder:
                  'Tell Us What Happened. The More Details You Provide, The Better We Can Help.',
              controller: longTextController,
              descriptionTextStyle:
                  TextUse.heading_1().copyWith(color: ColorsUse.accentColor),
              inputTextStyle:
                  TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
            ),
            const SizedBox(height: 16),
            const Center(
              child: PrimaryButton(
                name: 'Confirm',
                primary: ColorsUse.primaryColor,
                textColor: ColorsUse.backgroundColor,
                borderColor: false,
                // onPressed: () {
                //   // Define what happens when the button is pressed
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
