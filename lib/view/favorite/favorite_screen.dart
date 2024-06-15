import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/model/product_model.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/custom_cached_image.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../widgets/product_details_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final DatabaseService db = DatabaseService();
  @override
  void initState() {
    super.initState();
    _fetchFavoriteProducts();
  }

  List<Product> favorteProduct = [];
  bool _isLoading = true;
  Future<void> _fetchFavoriteProducts() async {
    List<Product> favoriteProducts = await db.getAllFavoriteProducts();
    log("message $favoriteProducts");
    setState(() {
      favorteProduct = favoriteProducts;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: TextWidget(
          text: 'Favorite',
          style: defaultTextstyle,
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: favorteProduct.length,
              itemBuilder: (context, index) {
                final product = favorteProduct[index];
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Colors.grey,
                      ),
                      bottom: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailWidget(
                              weight: product.weight,
                              isLike: product.isFav,
                              rating: product.review,
                              amount: product.prize.toString(),
                              productName: product.productName,
                              productdetail: product.productdetail,
                            ),
                          ));
                    },
                    leading: CustomCachedNetworkImage(
                      height: 40.h,
                      width: 40.h,
                      imageUrl: product.imgUrl,
                    ),
                    title: TextWidget(
                      text: product.productName,
                      style: defaultTextstyle,
                    ),
                    subtitle: TextWidget(
                      text: product.productdetail,
                      style: defaultTextstyle,
                    ),
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    trailing: Wrap(
                      children: [
                        TextWidget(
                          text: "${product.prize.toString()}rs",
                          style: defaultTextstyle,
                        ),
                        Icon(
                          Icons.navigate_next_sharp,
                          size: 20.sp,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
