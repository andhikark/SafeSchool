import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class PiechartRegion extends StatefulWidget {
  const PiechartRegion({super.key});

  @override
  State<PiechartRegion> createState() => _PiechartRegionState();
}

class _PiechartRegionState extends State<PiechartRegion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            centerSpaceRadius: 0,
            sectionsSpace: 5,
            startDegreeOffset: 0,
            sections: [
              PieChartSectionData(
                value: 20,
                color: PieRegionColors.north,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 60,
                color: PieRegionColors.east,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 40,
                color: PieRegionColors.west,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 40,
                color: PieRegionColors.south,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 80,
                color: PieRegionColors.northEast,
                radius: 130,
                showTitle: false,
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
