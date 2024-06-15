import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/Widgets/health_pro_card.dart';
import 'package:safeschool/Widgets/types_card.dart';
import 'package:url_launcher/url_launcher.dart';

class Helplines extends StatelessWidget {
  const Helplines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 30),
              child: Text(
                "Crisis Hotlines",
                style: TextUse.heading_3()
                    .merge(const TextStyle(color: ColorsUse.accentColor)),
              ),
            ),
            const HotlineInfos(
                name: "Social Help Center", ph_num: "Call: 1300"),
            const HotlineInfos(
                name: "Samaritans Thailand", ph_num: "Call: 02-113-6789"),
            const HotlineInfos(
                name: "Mental Health Consultation", ph_num: "Call: 1323"),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Supporting Organizations",
                    style: TextUse.heading_3()
                        .merge(const TextStyle(color: ColorsUse.accentColor)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                SupportOrgCard(
                                    img: "assets/images/hotline1.png",
                                    url:
                                        "https://www.childlinethailand.org/th/"),
                                SizedBox(
                                  width: 30,
                                ),
                                SupportOrgCard(
                                    img: "assets/images/hotline2.png",
                                    url: "https://www.unicef.org/thailand/th"),
                                SizedBox(
                                  width: 30,
                                ),
                                SupportOrgCard(
                                    img: "assets/images/hotline3.png",
                                    url: "https://www.camri.go.th/th/"),
                                SizedBox(
                                  width: 30,
                                ),
                                SupportOrgCard(
                                    img: "assets/images/hotline4.png",
                                    url:
                                        "https://thailand.savethechildren.net/"),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mental Health Professionals",
                        style: TextUse.heading_3().merge(
                            const TextStyle(color: ColorsUse.accentColor)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            HealthProCard(
                                title: "Dr. Johnson",
                                img: "assets/images/doc1.png",
                                url: "https://drcharryse.com/"),
                            SizedBox(
                              width: 30,
                            ),
                            HealthProCard(
                                title: "Dr. Srirangson",
                                img: "assets/images/doc2.png",
                                url:
                                    "https://www.bangkokhospital.com/en/doctor/dr-apisamai-srirangson"),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class HotlineInfos extends StatelessWidget {
  final String name;
  final String ph_num;

  const HotlineInfos({super.key, required this.name, required this.ph_num});

  Future<void> _launchDialer() async {
    final Uri uri = Uri(scheme: 'tel', path: ph_num);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $ph_num';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 30),
      child: GestureDetector(
        onTap: () => _launchDialer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextUse.heading_3().merge(
                  const TextStyle(fontSize: 12, color: ColorsUse.primaryColor)),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 330,
              decoration: BoxDecoration(
                color: ColorsUse.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 20),
                child: Text(
                  ph_num,
                  style: TextUse.body().merge(
                    const TextStyle(color: ColorsUse.accentColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SupportOrgCard extends StatelessWidget {
  final String img;
  final String url;
  const SupportOrgCard({super.key, required this.img, required this.url});

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
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: -2,
              blurRadius: 10,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 160,
            width: 180,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
