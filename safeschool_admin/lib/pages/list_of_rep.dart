import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/Utilities/text_use.dart';
import 'package:safeschool_admin/pages/ListOfReports/not_reviewed.dart';
import 'package:safeschool_admin/pages/ListOfReports/reviewed.dart';

class ListOfRep extends StatefulWidget {
  const ListOfRep({super.key});

  @override
  State<ListOfRep> createState() => _ListOfRepState();
}

class _ListOfRepState extends State<ListOfRep>
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
            'List of Reports',
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
                Tab(text: "Not Reviewed"),
                Tab(text: "Reviewed"),
              ],
              labelStyle: TextUse.heading_2().merge(
                const TextStyle(
                  fontFamily: "Rubik",
                ),
              ),
              indicator: const BoxDecoration(
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
                NotReviewed(),
                Reviewed(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
