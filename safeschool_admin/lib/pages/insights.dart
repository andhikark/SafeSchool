import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/pages/Statistics/region.dart';
import 'package:safeschool_admin/pages/Statistics/types_bully.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  State<Insights> createState() => _InsightsState();
}

class _InsightsState extends State<Insights>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'Insights',
            style:
                TextUse.heading_1().copyWith(color: ColorsUse.secondaryColor),
          ),
        ),
        backgroundColor: ColorsUse.primaryColor,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          Material(
            color: ColorsUse.secondaryColor,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: "Types of Bullying"),
                Tab(text: "By Region"),
              ],
              labelStyle: TextUse.heading_2().merge(
                const TextStyle(
                  fontFamily: "Rubik",
                ),
              ),
              indicator: BoxDecoration(
                color: ColorsUse.accentColor,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 5,
              indicatorPadding: EdgeInsets.zero,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: const Color.fromARGB(80, 0, 0, 0),
              labelPadding: const EdgeInsets.only(top: 5),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TypesBully(),
                Region(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
