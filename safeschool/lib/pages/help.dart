import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Help',
          style: TextUse.heading_1().copyWith(color: ColorsUse.backgroundColor),
        ),
        backgroundColor: ColorsUse.primaryColor, // Moved inside the AppBar widget
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorsUse.accentColor,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'FAQs',
                        style: TextUse.heading_1().copyWith(color: ColorsUse.accentColor)
                      ),
                    ),
                    const Icon(
                      Icons.question_mark,
                      color: ColorsUse.accentColor,
                    ),
                  ],
                ),
              ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'How can I get help if I\'m being bullied but don\'t feel comfortable reporting an incident?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The app also offers a variety of resources and support options for anyone experiencing bullying. You can access articles, videos, and quizzes to learn more about bullying, coping mechanisms, and bystander intervention. You can also connect with a crisis support hotline or mental health professional through the app anonymously.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What happens after I submit a report?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Your report will be reviewed by a designated authority who will then take appropriate actions to address the situation. You will be informed of the steps being taken and can choose to remain anonymous throughout the process.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'Will I get in trouble for reporting bullying?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No, you will not get in trouble for reporting bullying. The app is designed to protect the privacy and safety of all users. Reporting bullying is a responsible action and helps to create a safer environment for everyone.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What should I do if I witness someone being bullied?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Witnessing bullying can be distressing, but it\'s important to take action to help. You can report the incident through the app, providing as many details as possible. Additionally, if it\'s safe to do so, you can intervene by standing with the person being bullied or seeking help from a trusted adult or authority figure.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'Can I report bullying anonymously?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Yes, you can choose to report bullying anonymously. The app allows you to submit reports without revealing your identity. This ensures your safety and privacy while enabling authorities to take action against the bullying.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'How long does it take for a report to be addressed?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The time it takes to address a report can vary depending on the specifics of the incident and the policies of the institution handling the report. However, rest assured that all reports are taken seriously and will be reviewed and acted upon as promptly as possible.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What types of bullying can be reported through the app?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You can report various types of bullying through the app, including physical bullying, verbal bullying, social bullying, cyberbullying, sexual bullying, racial bullying, academic bullying, and bullying based on sexual orientation or gender identity.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What resources are available through the app to help me cope with bullying?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The app offers a variety of resources, including articles, videos, and quizzes on bullying prevention, coping strategies, and bystander intervention. Additionally, you can connect with crisis support hotlines and mental health professionals anonymously through the app for further assistance.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'Can I edit or update my report after submitting it?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Unfortunately, no. However, the app offers preview of your report before submission. On the other hand, you may submit another report if you would like to provide more information on the incident.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What should I do if I am retaliated against for reporting bullying?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'If you experience retaliation for reporting bullying, it\'s crucial to report this as well through the app. Retaliation is taken very seriously, and steps will be taken to ensure your safety and address the issue. You can also seek support from a trusted adult or authority figure.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'Can I use the app to report incidents other than bullying?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Yes, the app can be used to report various incidents that affect the safety and well-being of students. This includes harassment, discrimination, and other forms of misconduct. Providing detailed information helps ensure the appropriate response and support.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'What happens if I falsely report an incident?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Submitting false reports is taken very seriously and can undermine the efforts to address real issues. If a report is found to be intentionally false, appropriate actions will be taken as per the policies of the institution handling the report. It is important to report truthfully to maintain the integrity and effectiveness of the app.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(
                'How does the app ensure my privacy and data security?',
                style: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'The app uses advanced encryption and security measures to protect your personal information and the details of your reports. Your data is stored securely, and access is restricted to authorized personnel only. Additionally, you can choose to submit reports anonymously to further safeguard your privacy.',
                    style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
