import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String author;
  final String img;
  final String url;
  final EdgeInsetsGeometry? titlePadding;
  final CrossAxisAlignment? titleAlignment;

  const ArticleCard({
    super.key,
    required this.title,
    required this.author,
    required this.img,
    required this.url,
    this.titlePadding,
    this.titleAlignment,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
        child: Container(
          height: 200,
          width: 370,
          decoration: BoxDecoration(
            color: ColorsUse.secondaryColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: -2,
                blurRadius: 6,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12, bottom: 20),
                child: SizedBox(
                  height: 180,
                  width: 190,
                  child: Image.asset(img),
                ),
              ),
              Padding(
                padding: titlePadding ??
                    const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment:
                      titleAlignment ?? CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextUse.heading_2().merge(
                          const TextStyle(color: ColorsUse.primaryColor)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      author,
                      style: TextUse.heading_3().merge(const TextStyle(
                        fontSize: 12,
                        color: ColorsUse.accentColor,
                      )),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
