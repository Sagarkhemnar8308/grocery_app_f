import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'view/splachscreen/splachscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
          320,
          690,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (
          context,
          child,
        ) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const SplachScreen(),
            theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: <TargetPlatform, PageTransitionsBuilder>{
                  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
                  TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                },
              ),
            ),
          );
        });
  }
}
