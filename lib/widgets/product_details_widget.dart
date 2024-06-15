import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/button.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    this.isLike,
    required this.productName,
    required this.amount,
    required this.weight,
    required this.productdetail,
    this.rating,
  });
  final String productName;
  final bool? isLike;
  final String amount;
  final String weight;
  final String productdetail;
  final int? rating;
  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  bool isproductVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: white,
          height: 46.h,
          width: MediaQuery.of(context).size.width,
          child: CustomElevatedButton(
            textColor: white,
            backgroundColor: primaryColor,
            onPressed: () {},
            text: 'Add to Basket',
          ),
        ),
      ),
      appBar: AppBar(
          // title: TextWidget(
          //   text: 'Apple',
          //   style: defaultTextstyle,
          // ),
          // centerTitle: true,
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              manBackgroundimg,
              height: 150.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: widget.productName,
                  style: defaultTextstyle,
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_border))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.remove,
                      ),
                      onPressed: () {},
                    ),
                    TextWidget(
                      text: '0',
                      style: defaultTextstyle.copyWith(fontSize: 20.sp),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                TextWidget(
                  text:widget.amount ,
                  style: defaultTextstyle,
                ),
              ],
            ),
            TextWidget(
              text: widget.weight,
              style: defaultTextstyle,
            ),
            const Divider(
              color: Color.fromARGB(255, 230, 226, 226),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isproductVisible = !isproductVisible;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Product Deatil',
                    style: defaultTextstyle,
                  ),
                  Icon(isproductVisible
                      ? Icons.keyboard_arrow_down_sharp
                      : Icons.keyboard_arrow_up_rounded)
                ],
              ),
            ),
            isproductVisible
                ? SizedBox(
                    child: TextWidget(
                      text: widget.productdetail,
                      style: defaultTextstyle,
                    ),
                  )
                : const SizedBox(),
            const Divider(
              color: Color.fromARGB(255, 230, 226, 226),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Rating Star',
                  style: defaultTextstyle,
                ),
                RatingBar.builder(
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: index <= widget.rating! ? Colors.orange : Colors.grey,
                    size: 100,
                  ),
                onRatingUpdate: (value) {
                  
                },
                  initialRating: widget.rating!.toDouble(),
                  allowHalfRating: false,
                  minRating: 0.5,
                  itemCount: 5,
                  itemSize: 30,
                  updateOnDrag: true,
                ),
              ],
            ),
            const Divider(
              color: Color.fromARGB(255, 230, 226, 226),
            ),
          ],
        ),
      ),
    );
  }
}
