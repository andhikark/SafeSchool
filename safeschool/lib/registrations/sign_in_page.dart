import 'package:flutter/material.dart';
import 'package:safeschool/Utilities/colors_use.dart';
import 'package:safeschool/Widgets/bottom_navbar.dart';
import 'package:safeschool/components/buttons.dart';
import 'package:safeschool/Utilities/text_use.dart';
import 'package:safeschool/components/text_form_fields.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Dio dio = Dio();

  void _login() async {
    final data = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      final response = await _makeLoginRequest(data);
      Map<String, dynamic> jsonResponse = response.data;
      print(jsonResponse);
      if (jsonResponse['success'] == true) {
        String token = jsonResponse['payload']['token'];
        await _storeToken(token);
        print(token);

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavbar()),
        );
      } else {
        String errorMessage = jsonResponse['message'];
        _showErrorMessage('Login failed. $errorMessage');
      }
    } catch (e, stackTrace) {
      print('Error making login request: $e');
      print('Stack trace: $stackTrace');
      _showErrorMessage('Login Failed');
    }
  }

  Future<Response> _makeLoginRequest(Map<String, dynamic> data) async {
    return dio.post(
      'http://153.92.4.54:8080/auth/login', // Use HTTPS
      data: data,
    );
  }

  Future<void> _storeToken(String token) async {
    if (token != null) {
      try {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        print('Token: $token');
      } catch (e) {
        print('Error storing token: $e');
      }
    } else {
      _showErrorMessage('Token is null');
    }
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
                  const SizedBox(height: 50),
                  PrimaryButton(
                    name: 'Sign In',
                    primary: ColorsUse.primaryColor,
                    textColor: ColorsUse.backgroundColor,
                    borderColor: false,
                    onTap: _login, // Ensure the callback is passed correctly
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: TextUse.body()
                            .copyWith(color: ColorsUse.accentColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
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
