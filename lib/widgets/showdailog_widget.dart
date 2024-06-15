import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

customPopUp(
    BuildContext context, {
    String? heading,
    void Function()? yesonTap,
    double? height,
    double? width,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: TextWidget(
            textAlign: TextAlign.center,
            text: heading ?? "......",
            style: defaultTextstyle,
          ),
          actions: [
            InkWell(
              onTap: yesonTap,
              child: Container(
                height: height ?? 40.h,
                width: width ?? 75.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12.r,
                    ),
                  ),
                ),
                child: TextWidget(
                  text: 'yes',
                 style: defaultTextstyle.copyWith(
                  color: white
                 ),
                ),
              ),
            ),
           SizedBoxWidget(
            width: 10.w,
           ),
            InkWell(
              onTap: () {
              Navigator.pop(context);
              },
              child: Container(
                height: 40.h,
                width: 75.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color:primaryColor,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12.r,
                    ),
                  ),
                ),
                child: TextWidget(
                  text: 'No',
                  style: defaultTextstyle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }