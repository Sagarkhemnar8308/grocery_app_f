import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/widgets/button.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
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
      child: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width * 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              widget.imgUrl,
              height: 100.h,
              width: 100.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: widget.productName,
                ),
                TextWidget(
                  text: widget.weight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(onPressed: () {}, text: '-'),
                    const TextWidget(text: '2'),
                    CustomElevatedButton(onPressed: () {}, text: '+')
                  ],
                )
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconWidget(icon: Icons.close_rounded),
                TextWidget(text: '12rs')
              ],
            )
          ],
        ),
      ),
    );
  }
}
