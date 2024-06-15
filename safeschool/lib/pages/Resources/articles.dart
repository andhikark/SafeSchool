import 'package:flutter/material.dart';
import 'package:safeschool/Widgets/article_card.dart';

class Articles extends StatelessWidget {
  const Articles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ArticleCard(
              title: "What is\n bullying?",
              author: "StopBullying.gov",
              img: "assets/images/a1.jpg",
              url: "https://www.stopbullying.gov/what-is-bullying",
            ),
            SizedBox(
              height: 10,
            ),
            ArticleCard(
              title: "How to Deal\nWith Bullies",
              author: "KidsHealth",
              img: "assets/images/a2.jpg",
              url: "https://kidshealth.org/en/kids/bullies.html",
              titlePadding: EdgeInsets.only(top: 60.0, left: 15),
            ),
            SizedBox(
              height: 10,
            ),
            ArticleCard(
              title: "How\nBullying\nHotlines\nWork",
              author: "Verywell Family",
              img: "assets/images/a3.png",
              url:
                  "https://www.verywellfamily.com/how-bullying-hotlines-work-4589992",
              titlePadding: EdgeInsets.only(top: 30, left: 35),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
