import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/button.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({
    super.key,
    required this.productName,
    required this.weight,
    required this.rs,
    required this.imgUrl,
  });
  final String productName;
  final String weight;
  final String rs;
  final String imgUrl;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      child: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.imgUrl,
              height: 80.h,
              width: 100.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: widget.productName,
                  style: defaultTextstyle,
                ),
                TextWidget(
                  text: widget.weight,
                  style: defaultTextstyle,
                ),
                const SizedBoxWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      height: 30.h,
                      onPressed: () {},
                      text: '-',
                      textfontsize: 15.sp,
                      textColor: black,
                    ),
                    SizedBoxWidget(
                      width: 10.w,
                    ),
                     TextWidget(text: '2',style: defaultTextstyle,),
                      SizedBoxWidget(
                      width: 10.w,
                    ),
                    CustomElevatedButton(
                      textfontsize: 15.sp,
                      height: 30.h,
                      onPressed: () {},
                      text: '+',
                      textColor: black,
                    )
                  ],
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const IconWidget(icon: Icons.close_rounded),
                TextWidget(
                  text: '12rs',
                  style: defaultTextstyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
