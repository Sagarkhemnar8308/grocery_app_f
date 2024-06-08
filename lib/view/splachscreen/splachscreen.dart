import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'welcomescreen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
        (route) => false,
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
                      size: 70.sp,
                      color: white,
                    ),
                   
                  ],
                ),
                 SizedBox(
                  width: 12.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "SainathStore",
                      color: white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    TextWidget(
                      textAlign: TextAlign.center,
                      text: "online grocery",
                      color: white,
                      fontSize: 16.sp,
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
