import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/view/auth/forgetpassword.dart';
import 'package:grocery_app/view/auth/signupscreen.dart';
import 'package:grocery_app/view/dashboard.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../../widgets/button.dart';
import '../../widgets/textformfield_widget.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final obscurePass = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool loading = false;
  final DatabaseService db = DatabaseService();

  login() async {
    db.auth
        .signInWithEmailAndPassword(
            email: _emailController.text.toString(),
            password: _passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(msg: 'Login Successfully');

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
          (route) => false);
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Padding(
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
                      size: 60.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
                TextWidget(
                  text: "Log In",
                  style: defaultTextstyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextWidget(
                  text: "Enter your credentials continue",
                  style: greyTextStyle,
                ),
                const SizedBoxWidget(),
                const SizedBoxWidget(),
                TextformFieldWidget(
                  controller: _emailController,
                  hintText: "Email *",
                  hintStyle: greyTextStyle,
                  hintTextColor: black,
                ),
                const SizedBoxWidget(),
                ValueListenableBuilder(
                  builder: (context, value, child) {
                    return TextformFieldWidget(
                      controller: _passwordController,
                      obscureText: value,
                      hintText: "Password *",
                      suffixIcon: IconButton(
                        onPressed: () => obscurePass.value = !obscurePass.value,
                        icon: value
                            ? const IconWidget(
                                icon: Icons.visibility_off,
                              )
                            : const IconWidget(
                                icon: Icons.visibility,
                              ),
                      ),
                      hintStyle: greyTextStyle,
                      hintTextColor: black,
                    );
                  },
                  valueListenable: obscurePass,
                ),
                const SizedBoxWidget(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen(),
                        ));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextWidget(
                      text: 'forget password?',
                      style: defaultTextstyle.copyWith(
                          color: primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: primaryColor),
                    ),
                  ),
                ),
                const SizedBoxWidget(),
                CustomElevatedButton(
                  height: 46.h,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    login();
                  },
                  text: 'Log In',
                  textColor: white,
                  backgroundColor: primaryColor,
                ),
                SizedBoxWidget(
                  height: 20.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account ?  ",
                            style: TextStyle(
                                color: black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 12.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
