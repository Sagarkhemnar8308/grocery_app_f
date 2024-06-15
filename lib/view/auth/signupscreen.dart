import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/localestorage.dart';
import 'package:grocery_app/view/auth/loginscreen.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:grocery_app/widgets/textformfield_widget.dart';
import 'package:geolocator/geolocator.dart';
import '../../util/textstyles.dart';
import '../../widgets/button.dart';
import '../../widgets/icon_widget.dart';
import '../dashboard.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final DatabaseService db = DatabaseService();
  final obscurePass = ValueNotifier<bool>(true);
  bool loading = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signup() async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );

      String id = userCredential.user!.uid.toString();
      await db.userCollection.doc(id).set({
        "id": id,
        "username": usernameController.text.toString(),
        "email": emailController.text.toString(),
        "cart": [],
        "favorite": [],
        "latitude": lat == null ? null : lat,
        "longitude": long == null ? null : long,
      });
    } catch (error) {
      print("error is $error");
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  double? lat;
  double? long;

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      LocalStorageUtils.saveLatLong(
        position.latitude,
        position.longitude,
      );
      setState(() {
        lat = position.latitude;
        long = position.longitude;
      });
    } catch (e, stk) {
      print("Error getting location: $e $stk");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("object me lat $lat long $long");
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
                  text: "Sign Up",
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
                TextformFieldWidget(
                  controller: usernameController,
                  hintStyle: greyTextStyle,
                  hintText: "Username *",
                  rouneded: 12.r,
                  hintTextColor: black,
                ),
                const SizedBoxWidget(),
                TextformFieldWidget(
                  controller: emailController,
                  hintText: "Email *",
                  hintStyle: greyTextStyle,
                  hintTextColor: black,
                ),
                const SizedBoxWidget(),
                ValueListenableBuilder(
                  builder: (context, value, child) {
                    return TextformFieldWidget(
                      controller: passwordController,
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By contining you agree to our ',
                        style: defaultTextstyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Terms of Service ',
                        style: defaultTextstyle.copyWith(
                            fontSize: 10.sp, color: primaryColor),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: defaultTextstyle.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: defaultTextstyle.copyWith(
                          fontSize: 10.sp,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBoxWidget(
                  height: 15.h,
                ),
                CustomElevatedButton(
                  height: 46.h,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {
                    signup().then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ));
                    });
                  },
                  text: 'Sign Up',
                  textColor: white,
                  backgroundColor: primaryColor,
                ),
                SizedBoxWidget(
                  height: 13.h,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LogInScreen(),
                          ));
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account ?  ',
                            style: defaultTextstyle,
                          ),
                          TextSpan(
                            text: 'Log In',
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
