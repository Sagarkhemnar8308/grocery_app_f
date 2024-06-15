import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/button.dart';
import 'package:grocery_app/widgets/custom_cached_image.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class BuyCardWidget extends StatefulWidget {
  const BuyCardWidget({
    super.key,
    required this.productName,
    required this.weight,
    required this.rs,
    required this.imgUrl,
  });
  final String productName;
  final String weight;
  final int rs;
  final String imgUrl;

  @override
  State<BuyCardWidget> createState() => _BuyCardWidgetState();
}

class _BuyCardWidgetState extends State<BuyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(
          12.r,
        ),
      ),
      child: Container(
        color: white,
        padding: const EdgeInsets.all(10),
        height: 210.h,
        width: 150.w,
        child: Column(
          children: [
            CustomCachedNetworkImage(
              height: 95.h,
              width: MediaQuery.of(context).size.width,
              imageUrl: widget.imgUrl,
            ),
            const SizedBoxWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: widget.productName,
                  style: defaultTextstyle,
                ),
                TextWidget(
                  text: widget.weight,
                  style: defaultTextstyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "${widget.rs.toString()}rs",
                      style: defaultTextstyle,
                    ),
                    CustomElevatedButton(
                      height: 40.h,
                      width: 45.w,
                      textColor: white,
                      textfontsize: 13.sp,
                      backgroundColor: primaryColor,
                      onPressed: () {},
                      text: '+',
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
