import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class PiechartStats extends StatefulWidget {
  const PiechartStats({super.key});

  @override
  State<PiechartStats> createState() => _PiechartStatsState();
}

class _PiechartStatsState extends State<PiechartStats> {
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
                color: PieToBColors.verbal,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 60,
                color: PieToBColors.physical,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 40,
                color: PieToBColors.cyber,
                radius: 130,
                showTitle: false,
              ),
              PieChartSectionData(
                value: 40,
                color: PieToBColors.sexual,
                radius: 130,
                showTitle: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
