import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/Widgets/piechart_region.dart';

class Region extends StatelessWidget {
  const Region({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            child: PiechartRegion(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 40),
            child: Stack(
              children: [
                Container(
                  height: 230,
                  width: 370,
                  decoration: BoxDecoration(
                      color: ColorsUse.secondaryColor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: ColorsUse.accentColor, width: 1.75)),
                ),
                Positioned(
                  top: 20,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieRegionColors.north,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "North",
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
                          color: PieRegionColors.northEast,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "North East",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieRegionColors.west,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "West",
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
                          color: PieRegionColors.east,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "East",
                        style: TextUse.heading_2().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 30,
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: PieRegionColors.south,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "South",
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
