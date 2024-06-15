import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/button.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:grocery_app/widgets/textformfield_widget.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final DatabaseService db = DatabaseService();
  final TextEditingController _emailcontroller = TextEditingController();

  void resetpassword() {
    db.auth
        .sendPasswordResetEmail(email: _emailcontroller.text.toString())
        .then((value) {
      Fluttertoast.showToast(
        msg: "Password reset email sent. Please check your inbox.",
      );
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: 'Reset Password',
          style: defaultTextstyle.copyWith(
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextformFieldWidget(
              controller: _emailcontroller,
              hintText: 'Email *',
            ),
            const SizedBoxWidget(),
            TextWidget(
              text:
                  'By enter email we sent a reset password to your email you can easily reset password',
              style: defaultTextstyle.copyWith(fontSize: 8.sp),
            ),
            const SizedBoxWidget(),
            CustomElevatedButton(
              backgroundColor: primaryColor,
              textColor: white,
              buttonRadius: 5.r,
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                resetpassword();
              },
              text: 'Reset Password',
            )
          ],
        ),
      ),
    );
  }
}
