import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/Widgets/types_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> _logout(BuildContext context) async {
    try {
      // final prefs = await SharedPreferences.getInstance(); // await here
      // final token =
      //     prefs.getString('token'); // Get the token from SharedPreferences
      // print('Token: $token'); // Print the token
      // await prefs.remove('token'); // Remove the token from SharedPreferences

      // Navigate to the login screen, replacing the current stack
      Navigator.pushNamedAndRemoveUntil(
          context, '/firstpage', (route) => false);
    } catch (e) {
      print('Error logging out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: ColorsUse.primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: -2,
                        blurRadius: 8,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 1, top: 75),
                      child: Container(
                        child: Text(
                          "Hi There!",
                          style: TextUse.heading_1().merge(
                            const TextStyle(
                              color: ColorsUse.secondaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 35.0),
                      child: Text(
                        "How can we help \nyou today?",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsUse.secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 220, top: 42.0),
                      child: SizedBox(
                          height: 160,
                          width: 160,
                          child: Image.asset("assets/images/greeting.png")),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 38.0, top: 235),
                          child: Text(
                            "How to submit a report?",
                            style: TextUse.heading_2().merge(
                              const TextStyle(
                                color: ColorsUse.accentColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 170,
                      width: 330,
                      decoration: BoxDecoration(
                        color: ColorsUse.accentColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: -1,
                            blurRadius: 3,
                            offset: const Offset(0, 7),
                          )
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '1. Tap "Report Incident"\n'
                            '2. Choose the type of bullying.\n'
                            '3. Tell us what happened.\n'
                            '4. (Optional) Add details (photos or screenshots).\n'
                            '5. Review your report.\n'
                            '6. Submit your report.',
                            style: TextUse.body(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 475.0, left: 38),
                      child: Text(
                        "Types of Bullying",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TypesCard(
                            title: "Physical",
                            img: "assets/images/physical_Bullying.png",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/bullying_types/physical');
                            },
                          ),
                          TypesCard(
                            title: "Verbal",
                            img: "assets/images/verbal_Bullying.png",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/bullying_types/verbal');
                            },
                          ),
                          TypesCard(
                            title: "Cyber",
                            img: "assets/images/cyber_Bullying.png",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/bullying_types/cyber');
                            },
                          ),
                          TypesCard(
                            title: "Sexual H.",
                            img: "assets/images/sh_Bullying.png",
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/bullying_types/sexual_h');
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 23,
                  left: 260,
                  child: ElevatedButton(
                    onPressed: () {
                      _logout(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: ColorsUse.accentColor,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 5,
                      ),
                      textStyle: TextUse.heading_3().merge(const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      elevation: 5,
                    ),
                    child: const Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
