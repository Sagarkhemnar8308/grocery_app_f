import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/view/homescreen/homescreen.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:grocery_app/widgets/textformfield_widget.dart';

import '../../widgets/button.dart';
import '../../widgets/icon_widget.dart';
import '../dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: 200.h,
                  child: IconWidget(
                    icon: Icons.local_grocery_store_outlined,
                    size: 70.sp,
                    color: black,
                  ),
                ),
              ),
              const TextWidget(text: "Sign Up"),
              const TextWidget(text: "Enter your credentials continue"),
              TextformFieldWidget(
                controller: usernameController,
                labeltext: "Username",
                hintTextColor: black,
              ),
              const SizedBoxWidget(),
              TextformFieldWidget(
                controller: emailController,
                labeltext: "Email",
                hintTextColor: black,
              ),
              const SizedBoxWidget(),
              TextformFieldWidget(
                controller: passwordController,
                labeltext: "Password",
                hintTextColor: black,
              ),
              const SizedBoxWidget(),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'By contining you agree to our'),
                    TextSpan(text: 'Terms of Service '),
                    TextSpan(text: 'and'),
                    TextSpan(text: 'Privacy Policy'),
                  ],
                ),
              ),
              CustomElevatedButton(
                height: 46.h,
                width: MediaQuery.of(context).size.width,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ));
                },
                text: 'Sign Up',
                textColor: white,
                backgroundColor: primaryColor,
              ),
              SizedBoxWidget(
                height: 20.h,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: black)),
                      TextSpan(text: 'Sign Up', style: TextStyle(color: black)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
