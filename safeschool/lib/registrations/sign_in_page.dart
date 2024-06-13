import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/components/buttons.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/text_form_fields.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipPath(
              clipper: BottomCircleClipper(),
              child: Container(
                height: 400,
                width: double.infinity,
                color: ColorsUse.primaryColor,
                child: Center(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.75, // Show only the bottom half
                      child: Image.asset(
                        'assets/images/signinpic.png', // Replace with your asset image
                        height: 400,
                        width: 250, // Increase the height to enlarge the image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Sign In',
              style: TextUse.heading_1().copyWith(color: ColorsUse.accentColor),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    description: "Email",
                    placeholder: "Your email",
                    controller: emailController,
                    descriptionTextStyle: TextUse.heading_2(),
                    inputTextStyle: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
                  ),
                  const SizedBox(height: 0.5),
                  CustomTextFormField(
                    description: "Password",
                    placeholder: "..............",
                    isPassword: true,
                    controller: passwordController,
                    descriptionTextStyle: TextUse.heading_2(),
                    inputTextStyle: TextUse.heading_3().copyWith(color: ColorsUse.accentColor),
                  ),
                  const SizedBox(height: 50),
                  const PrimaryButton(
                    name: 'Sign In',
                    primary: ColorsUse.primaryColor,
                    textColor: ColorsUse.backgroundColor,
                    borderColor: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextUse.body().copyWith(color: ColorsUse.accentColor),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle register action
                        },
                        child: Text(
                          'Register here',
                          style: TextUse.body().copyWith(
                            color: ColorsUse.primaryColor,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsUse.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.7);
    path.quadraticBezierTo(
      size.width / 2, size.height,
      size.width, size.height * 0.7,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
