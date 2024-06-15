import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/view/auth/signupscreen.dart';
import 'package:grocery_app/view/dashboard.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../../widgets/sizedbox_widget.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  final DatabaseService db = DatabaseService();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      db.auth.currentUser != null
          ? Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),(route) => false,)
          : Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),(route) => false,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconWidget(
                      icon: Icons.local_grocery_store_outlined,
                      size: 50.sp,
                      color: white,
                    ),
                  ],
                ),
                SizedBoxWidget(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Sainath Store",
                      style: oswaldTextStyle,
                    ),
                    TextWidget(
                      textAlign: TextAlign.center,
                      text: "online groceriet",
                      color: white,
                      fontSize: 10.sp,
                      letterSpacing: 8,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
