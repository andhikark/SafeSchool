import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/Widgets/piechart_tob.dart';

class TypesBully extends StatelessWidget {
  const TypesBully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: PiechartStats(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 370,
                  decoration: BoxDecoration(
                      color: ColorsUse.secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: ColorsUse.accentColor, width: 1.75)),
                ),
                Positioned(
                  top: 40,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieToBColors.verbal,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Verbal",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieToBColors.physical,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Physical",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 120,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieToBColors.cyber,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Cyber",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                      const SizedBox(
                        width: 32,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieToBColors.sexual,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sexual H.",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                    ],
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
