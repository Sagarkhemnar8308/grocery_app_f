import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/model/product_model.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/widgets/custom_cached_image.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../services/firebase_services.dart';
import '../../widgets/product_details_widget.dart';
import '../../widgets/searchtextformfield.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final DatabaseService dbService = DatabaseService();
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchAllProducts();
  }

  Future<void> _fetchAllProducts() async {
    List<Product> products = await dbService.getAllProducts();
    setState(() {
      allProducts = products;
      filteredProducts = products;
    });
  }

  void _filterProducts(String query) {
    setState(() {
      searchQuery = query;
      filteredProducts = allProducts
          .where((product) =>
              product.productName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: TextWidget(
          text: 'Find Products',
          style: TextStyle(
            fontSize: 13.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SearchTextFormField(
              autofocus: true,
              onChanged: _filterProducts,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ListTile(
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
