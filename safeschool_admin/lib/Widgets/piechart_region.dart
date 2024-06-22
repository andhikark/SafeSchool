import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class PiechartRegion extends StatefulWidget {
  const PiechartRegion({super.key});

  @override
  State<PiechartRegion> createState() => _PiechartRegionState();
}

class _PiechartRegionState extends State<PiechartRegion> {
  late Future<List<ReportRegion>> futureReportData;
  int? touchedIndex;

  @override
  void initState() {
    super.initState();
    futureReportData = fetchReportData();
  }

  Future<List<ReportRegion>> fetchReportData() async {
    try {
      final response =
          await Dio().get('http://10.0.2.2:8080/report/reportByRegion');
      print(response);
      if (response.data['success']) {
        Map<String, dynamic> data = response.data['payload'];
        print(data);
        return data.entries
            .map((entry) =>
                ReportRegion(region: entry.key, value: entry.value.toDouble()))
            .toList();
      } else {
        throw Exception('Failed to fetch report data');
      }
    } catch (e) {
      throw Exception('Failed to load report data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ReportRegion>>(
      future: futureReportData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        }

        List<ReportRegion> data = snapshot.data!;
        double total = data.fold(0, (sum, item) => sum + item.value);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 0,
                sectionsSpace: 5,
                startDegreeOffset: 0,
                sections: data.asMap().entries.map((entry) {
                  int index = entry.key;
                  ReportRegion region = entry.value;
                  final isTouched = index == touchedIndex;
                  final double fontSize = isTouched ? 25.0 : 16.0;
                  final double radius = isTouched ? 140.0 : 130.0;
                  final double percentage = (region.value / total) * 100;

                  return PieChartSectionData(
                    value: region.value,
                    color: getColorForRegion(region.region),
                    radius: radius,
                    title: isTouched ? '${percentage.toStringAsFixed(1)}%' : '',
                    titleStyle: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    showTitle: true,
                  );
                }).toList(),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color getColorForRegion(String region) {
    switch (region) {
      case 'north':
        return PieRegionColors.north;
      case 'south':
        return PieRegionColors.south;
      case 'east':
        return PieRegionColors.east;
      case 'north east':
        return PieRegionColors.northEast;
      case 'central':
        return PieRegionColors.central;
      default:
        return Colors.grey;
    }
  }
}

class ReportRegion {
  final String region;
  final double value;

  ReportRegion({required this.region, required this.value});
}
