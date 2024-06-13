import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class Physical extends StatelessWidget {
  const Physical({Key? key});

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
                        "Physical\nBullying",
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
                        child:
                            Image.asset("assets/images/physical_Bullying.png"),
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
                child: Text("What is Physical Bullying?",
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
                height: 170,
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
                              "Physical bullying is any unwanted physical contact that is intended to hurt, humiliate, or intimidate another person. This can include actions like: ",
                        ),
                        TextSpan(
                          text: "\n",
                        ),
                        TextSpan(
                          text:
                              "\n\u2022 Hitting, kicking, shoving, or tripping \n\u2022 Spitting, biting, or scratching\n\u2022 Stealing or damaging belongings\n\u2022 Locking someone in a room or closet\n\u2022 Unwanted physical touch or body blocking",
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
                "Signs of Physical Bullying",
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
                height: 230,
                width: 320,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorsUse.secondaryColor),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "\u2022 Unexplained bruises, cuts, scrapes, or other injuries\n\u2022 Torn or damaged clothing\n\u2022 Frequent loss of belongings\n\u2022 Complaints of stomach aches, headaches, or other physical ailments (may be psychosomatic)\n\u2022 Change in eating habits (not wanting to eat lunch, loss of appetite)\n\u2022 Trouble sleeping or nightmares\n\u2022 Withdrawing from social activities or refusing to go to school",
                      style: TextUse.body()
                          .merge(const TextStyle(color: ColorsUse.accentColor)),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0, top: 40, right: 15),
              child: Text(
                "What to Do if You Are Experiencing Physical Bullying",
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
                            text: 'Stay safe: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'If you are in immediate danger, try to move away from the situation and find a safe place to go. You can report it to a trusted adult or call for help.',
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
                            text: 'Don\'t fight back: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'Fighting back might escalate the situation. It\'s better to walk away and report the bullying.',
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
                            text: 'Remember, you\'re not alone: ',
                            style: TextUse.body().merge(const TextStyle(
                                color: ColorsUse.primaryColor,
                                fontWeight: FontWeight.w500)),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      'There are people who care about you and want to help.',
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
