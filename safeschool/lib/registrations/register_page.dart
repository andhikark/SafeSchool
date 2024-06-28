import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/components/buttons.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/text_form_fields.dart';
import 'package:dio/dio.dart';
import 'package:safeschool/registrations/sign_in_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _termsAccepted = false;
  final Dio dio = Dio();

  void _register() async {
    final data = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await _makeLoginRequest(data);
      Map<String, dynamic> jsonResponse = response.data;

      if (jsonResponse['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),
        );
      } else {
        String errorMessage = jsonResponse['message'];
        _showErrorMessage('Login failed. $errorMessage');
      }
    } catch (e) {
      _showErrorMessage('Login Failed');
    }
  }

  Future<Response> _makeLoginRequest(Map<String, dynamic> data) async {
    return dio.post(
      'http://153.92.4.54:8080/auth/register', // Use HTTPS
      data: data,
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

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
                decoration: BoxDecoration(
                  color: ColorsUse.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 300,
                width: double.infinity,
                child: Center(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.75, // Show only the bottom half
                      child: Image.asset(
                        'assets/images/regispic.png', // Replace with your asset image
                        height: 300,
                        width: 300, // Increase the height to enlarge the image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Register',
              style: TextUse.heading_1().copyWith(color: ColorsUse.accentColor),
            ),
            const SizedBox(
              height: 30,
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
                    inputTextStyle: TextUse.heading_3()
                        .copyWith(color: ColorsUse.accentColor),
                  ),
                  const SizedBox(height: 0.5),
                  CustomTextFormField(
                    description: "Password",
                    placeholder: "..............",
                    isPassword: true,
                    controller: passwordController,
                    descriptionTextStyle: TextUse.heading_2(),
                    inputTextStyle: TextUse.heading_3()
                        .copyWith(color: ColorsUse.accentColor),
                  ),
                  const SizedBox(height: 0.5),
                  CustomTextFormField(
                    description: "Confirm Password",
                    placeholder: "..............",
                    isPassword: true,
                    controller: confirmPasswordController,
                    descriptionTextStyle: TextUse.heading_2(),
                    inputTextStyle: TextUse.heading_3()
                        .copyWith(color: ColorsUse.accentColor),
                  ),
                  //const SizedBox(height: 10),
                  Row(
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _termsAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            _termsAccepted = value ?? false;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'I accept the terms and privacy policy',
                          style: TextUse.body()
                              .copyWith(color: ColorsUse.accentColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  PrimaryButton(
                    name: 'Register',
                    primary: ColorsUse.primaryColor,
                    textColor: ColorsUse.backgroundColor,
                    borderColor: false,
                    onTap: _register,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextUse.body()
                            .copyWith(color: ColorsUse.accentColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text(
                          'Sign in here',
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
      size.width / 2,
      size.height,
      size.width,
      size.height * 0.7,
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
