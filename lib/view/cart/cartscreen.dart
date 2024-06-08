import 'package:flutter/material.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/widgets/cart_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        title: const TextWidget(
          text: 'My Cart',
        ),
      ),
      body: Column(
        children: [
          CartWidget(
            productName: "productName",
            weight: "weight",
            rs: "rs",
            imgUrl: manBackgroundimg,
          )
        ],
      ),
    );
  }
}
