import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';

class PiechartStats extends StatefulWidget {
  const PiechartStats({super.key});

  @override
  State<PiechartStats> createState() => _PiechartStatsState();
}

class _PiechartStatsState extends State<PiechartStats> {
  late Future<List<BullyingType>> futureBullyingData;
  int? touchedIndex;

  @override
  void initState() {
    super.initState();
    futureBullyingData = fetchBullyingData();
  }

  Future<List<BullyingType>> fetchBullyingData() async {
    try {
      final response =
          await Dio().get('http://153.92.4.54:8080/report/reportByType');
      if (response.data['success']) {
        Map<String, dynamic> data = response.data['payload'];
        return data.entries
            .map((entry) =>
                BullyingType(type: entry.key, value: entry.value.toDouble()))
            .toList();
      } else {
        throw Exception('Failed to fetch bullying data');
      }
    } catch (e) {
      throw Exception('Failed to load bullying data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BullyingType>>(
      future: futureBullyingData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No data available'));
        }

        List<BullyingType> data = snapshot.data!;
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
                  BullyingType bullyingType = entry.value;
                  final isTouched = index == touchedIndex;
                  final double fontSize = isTouched ? 25.0 : 16.0;
                  final double radius = isTouched ? 140.0 : 130.0;
                  final double percentage = (bullyingType.value / total) * 100;

                  return PieChartSectionData(
                    value: bullyingType.value,
                    color: getColorForBullyingType(bullyingType.type),
                    radius: radius,
                    title: isTouched
                        ? '${percentage.toStringAsFixed(1)}%\n${bullyingType.value.toInt()} reports'
                        : '${bullyingType.value.toInt()}',
                    titleStyle: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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

  Color getColorForBullyingType(String type) {
    switch (type) {
      case 'verbal':
        return PieToBColors.verbal;
      case 'physical':
        return PieToBColors.physical;
      case 'cyber':
        return PieToBColors.cyber;
      case 'sexual harassment':
        return PieToBColors.sexual;
      default:
        return Colors.grey;
    }
  }
}

class BullyingType {
  final String type;
  final double value;

  BullyingType({required this.type, required this.value});
}
