import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class Verbal extends StatelessWidget {
  const Verbal({super.key});

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
                        "Verbal\nBullying",
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
                        child: Image.asset("assets/images/verbal_Bullying.png"),
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
                child: Text("What is Verbal Bullying?",
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
                height: 180,
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
                              "Verbal bullying is using words to hurt, humiliate, or intimidate another person. Here are some examples:",
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "\n\u2022 Name-calling, insults, and teasing \n\u2022 Threats and put-downs\n\u2022 Spreading rumors or gossiping\n\u2022 Making offensive remarks about someone's appearance, race, ethnicity, religion, or sexual orientation\n\u2022 Yelling or screaming",
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
                "Signs of Verbal Bullying",
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
                      "\u2022 Feeling upset, hurt, or angry after interacting with someone\n\u2022 Difficulty concentrating in school\n\u2022 Loss of self-confidence or feelings of worthlessness\n\u2022 Withdrawing from social activities or avoiding certain places\n\u2022 Changes in eating or sleeping habits\n\u2022 Difficulty trusting others",
                      style: TextUse.body()
                          .merge(const TextStyle(color: ColorsUse.accentColor)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 40, right: 15),
              child: Text(
                "What to Do if You Are Experiencing Verbal Bullying",
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
                height: 260,
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
                            text: 'Stay calm: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Don\'t react to the bully\'s words. Ignoring them can take away their power.',
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
                            text: 'Walk away: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'If you can, remove yourself from the situation.',
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
                            text: 'Stand tall and speak up: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'If you feel comfortable, tell the bully to stop in a firm voice.',
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
                            text: 'Remember, you are worthy of respect: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'No one deserves to be treated this way.',
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
