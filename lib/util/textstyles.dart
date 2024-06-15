import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/constant/colors.dart';

TextStyle defaultTextstyle = TextStyle(
  color: Colors.grey.shade700,
  fontSize: 12.sp,
  fontWeight: FontWeight.w500,
  letterSpacing: 1,
);

TextStyle textEditingStyle = TextStyle(
  fontSize: 11.sp,
  fontWeight: FontWeight.w600,
  color: const Color.fromARGB(255, 71, 70, 70),
);

TextStyle greyTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.w600,
  color: const Color.fromARGB(255, 157, 156, 156),
);

TextStyle oswaldTextStyle = GoogleFonts.oswald(
  fontSize: 35.sp,
  fontWeight: FontWeight.w600,
  color: white,
);

TextStyle bodyTextStyle = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.normal,
  color: black,
);
