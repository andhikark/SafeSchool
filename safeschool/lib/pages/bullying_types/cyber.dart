import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class Cyber extends StatelessWidget {
  const Cyber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 320,
                      color: ColorsUse.primaryColor,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 38.0, top: 120),
                      child: Text(
                        "Cyber\nBullying",
                        style: TextUse.heading_1(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 175, top: 50),
                      child: SizedBox(
                        height: 220,
                        child: Image.asset("assets/images/cyber_Bullying.png"),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: ColorsUse.secondaryColor,
                      )),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 38),
              child: Container(
                child: Text("What is Cyberbullying?",
                    style: TextUse.heading_2()
                        .merge(const TextStyle(color: ColorsUse.accentColor))),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Container(
                height: 240,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsUse.secondaryColor),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextUse.body()
                          .merge(const TextStyle(color: ColorsUse.accentColor)),
                      children: const [
                        TextSpan(
                          text:
                              "Cyberbullying is the use of electronic communication to bully a person, typically by sending messages of an intimidating or threatening nature. It can happen anywhere online, including social media, texting, chat rooms, and online games. Here are some examples:",
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "\n\u2022 Sending mean or threatening messages \n\u2022 Spreading rumors or gossip online\n\u2022 Posting embarrassing photos or videos of someone without their permission\n\u2022 Excluding someone from online groups or activities\n\u2022 Impersonating someone online to make them look bad",
                          style: TextStyle(
                              color:
                                  ColorsUse.primaryColor), // Change color here
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 40),
              child: Text(
                "Signs of Cyberbullying",
                style: TextUse.heading_2()
                    .merge(const TextStyle(color: ColorsUse.accentColor)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Container(
                height: 200,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsUse.secondaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "\u2022 Withdrawing from social media or online activities\n\u2022 Becoming upset or withdrawn after using electronic devices\n\u2022 Being secretive about their online activity\n\u2022 Changes in mood or behavior (sadness, anger, anxiety)\n\u2022 Difficulty sleeping or eating\n\u2022 Loss of interest in school or hobbies",
                      style: TextUse.body()
                          .merge(const TextStyle(color: ColorsUse.accentColor)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 40, right: 15),
              child: Text(
                "What to Do if You Are Experiencing Cyberbullying",
                style: TextUse.heading_2()
                    .merge(const TextStyle(color: ColorsUse.accentColor)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38),
              child: Container(
                height: 275,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsUse.secondaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Don\'t respond: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Responding to the bully can encourage them to continue.',
                                  style: TextStyle(
                                      color: ColorsUse.accentColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Save the evidence: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Take screenshots or save copies of the cyberbullying messages.',
                                  style: TextStyle(
                                      color: ColorsUse.accentColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Block the bully: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Block the bully on social media and other online platforms.',
                                  style: TextStyle(
                                      color: ColorsUse.accentColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Tell someone you trust: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Talk to a parent, teacher, counselor, or another trusted adult about what is happening.',
                                  style: TextStyle(
                                      color: ColorsUse.accentColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Report it to the platform: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Most social media platforms and online games have ways to report cyberbullying.',
                                  style: TextStyle(
                                      color: ColorsUse.accentColor,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
