// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grocery_app/constant/colors.dart';
// import 'package:grocery_app/constant/images.dart';
// import 'package:grocery_app/view/auth/signupscreen.dart';
// import 'package:grocery_app/widgets/button.dart';
// import 'package:grocery_app/widgets/sizedbox_widget.dart';
// import 'package:grocery_app/widgets/text_widget.dart';

// import '../../widgets/icon_widget.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: primaryColor,
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//              Image.asset(
//               manBackgroundimg,
//               height: 400.h,
//               width: MediaQuery.of(context).size.width * 1,
//               fit: BoxFit.fill,
//             ),
           
//           Column(
//             children: [
//                 IconWidget(
//               icon: Icons.local_grocery_store_outlined,
//               size: 40.sp,
//               color: white,
//             ),
//             const SizedBoxWidget(),
//             TextWidget(
//               textAlign: TextAlign.center,
//               text: "Welcome \nto Our Store",
//               fontSize: 25.sp,
//               color: white,
//             ),
//             const SizedBoxWidget(),
//             TextWidget(
//               textAlign: TextAlign.center,
//               text: "Get Your Groceries In As Fast As One Hour ",
//               fontSize: 11.sp,
//               color: white,
//             ),
//             SizedBoxWidget(
//               height: 20.h,
//             ),
//             CustomElevatedButton(
//               height: 46.h,
//               width: MediaQuery.of(context).size.width,
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder: (context) =>const SignUpScreen(),));
//               },
//               text: 'Get Started',
//               textColor: white,
//               backgroundColor: primaryColor,
//             ),
//             SizedBoxWidget(
//               height: 25.h,
//             ),
//             ],
//           )
//           ],
//         ),
//       ),
//     );
//   }
// }
