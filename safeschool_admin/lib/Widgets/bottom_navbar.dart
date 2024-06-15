import 'package:flutter/material.dart';
import 'package:safeschool_admin/Utilities/colors_use.dart';
import 'package:safeschool_admin/pages/list_of_rep.dart';
import 'package:safeschool_admin/pages/insights.dart';

class CustomNavigationDestination extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavigationDestination({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? ColorsUse.primaryColor : Colors.grey,
            size: 28,
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isSelected ? ColorsUse.primaryColor : Colors.grey,
              fontFamily: "Rubik",
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int index = 0;
  final pages = [
    ListOfRep(),
    Insights(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: ColorsUse.primaryColor,
                  fontFamily: "Rubik",
                );
              }
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(100, 0, 0, 0),
                fontFamily: "Rubik",
              );
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: ColorsUse.primaryColor,
                  size: 26,
                );
              }
              return const IconThemeData(
                color: Color.fromARGB(80, 0, 0, 0),
                size: 26,
              );
            },
          ),
          indicatorColor: Colors.transparent,
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: ColorsUse.secondaryColor,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            CustomNavigationDestination(
              icon: Icons.library_books_rounded,
              label: "List of Reports",
              isSelected: index == 0,
              onTap: () => setState(() => index = 0),
            ),
            CustomNavigationDestination(
              icon: Icons.insert_chart,
              label: "Insights",
              isSelected: index == 1,
              onTap: () => setState(() => index = 1),
            ),
          ],
        ),
      ),
    );
  }
}
