import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class SexualH extends StatelessWidget {
  const SexualH({super.key});

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
                        "Sexual\nHarassment",
                        style: TextUse.heading_1(),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200, top: 50),
                      child: SizedBox(
                        height: 220,
                        child: Image.asset("assets/images/sh_Bullying.png"),
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
                child: Text("What is Sexual Harassment?",
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
                height: 210,
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
                              "Sexual harassment is unwelcome sexual advances, requests for sexual favors, and other verbal or physical conduct of a sexual nature.  It can happen anywhere, including at school. Here are some examples of sexual harassment:",
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "\n\u2022 Unwanted sexual comments or jokes \n\u2022 Making sexual gestures or advances\n\u2022 Sending sexually suggestive texts or messages\n\u2022 Spreading rumors about someone's sexual activity\n\u2022 Touching someone in a sexual way without their consent",
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
                "Signs of Sexual Harassment",
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
                height: 180,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsUse.secondaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "\u2022 Feeling uncomfortable, unsafe, or embarrassed\n\u2022 Difficulty concentrating in school\n\u2022 Avoiding certain people or places\n\u2022 Changes in eating or sleeping habits\n\u2022 Withdrawing from social activities or feeling isolated\n\u2022 Feeling ashamed or like it's your fault",
                      style: TextUse.body()
                          .merge(const TextStyle(color: ColorsUse.accentColor)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 40, right: 15),
              child: Text(
                "What to Do if You Are Experiencing Sexual H.",
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
                height: 245,
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
                            text: 'Tell the person to stop: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'In a firm voice, tell the person that their behavior is making you uncomfortable and you want them to stop.',
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
                                      'Remove yourself from the situation if possible.',
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
                            text: 'Remember, you are not alone: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Sexual harassment is never your fault. There are people who care about you and want to help.',
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
