import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthProCard extends StatelessWidget {
  final String title;
  final String img;
  final String url;
  const HealthProCard(
      {super.key, required this.title, required this.img, required this.url});

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: _launchUrl,
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
    );
  }
}
