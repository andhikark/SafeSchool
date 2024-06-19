import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PiechartStats extends StatefulWidget {
  const PiechartStats({super.key});

  @override
  State<PiechartStats> createState() => _PiechartStatsState();
}

class _PiechartStatsState extends State<PiechartStats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: PieChart(
        PieChartData(
          centerSpaceRadius: 0,
          sectionsSpace: 5,
          startDegreeOffset: 0,
          sections: [
            PieChartSectionData(
              value: 20,
              color: Color.fromARGB(255, 92, 198, 127),
              radius: 160,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 60,
              color: Color.fromARGB(255, 103, 158, 220),
              radius: 160,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 40,
              color: Color.fromARGB(255, 220, 216, 103),
              radius: 160,
              showTitle: false,
            ),
            PieChartSectionData(
              value: 40,
              color: Color.fromARGB(255, 246, 140, 193),
              radius: 160,
              showTitle: false,
            ),
          ],
        ),
      ),
    );
  }
}
