import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';

class TypesCard extends StatelessWidget {
  final String title;
  final String img;
  final VoidCallback? onTap;

  const TypesCard({
    Key? key,
    required this.title,
    required this.img,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap, // Just pass onTap directly
        splashColor: const Color.fromARGB(255, 236, 236, 233),
        child: Ink(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: ColorsUse.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                title,
                style: TextUse.heading_2().merge(
                  const TextStyle(color: ColorsUse.primaryColor),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              SizedBox(height: 130, width: 130, child: Image.asset(img))
            ],
          ),
        ),
      ),
    );
  }
}
