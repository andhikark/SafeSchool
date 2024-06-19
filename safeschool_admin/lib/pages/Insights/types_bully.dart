import 'package:flutter/material.dart';
import 'package:safeschool_admin/Widgets/piechart_stats.dart';

class TypesBully extends StatelessWidget {
  const TypesBully({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: 200.0),
        child: PiechartStats(),
      ),
    );
  }
}
