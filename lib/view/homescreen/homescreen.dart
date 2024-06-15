import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:grocery_app/services/firebase_services.dart';
import 'package:grocery_app/util/textstyles.dart';
import 'package:grocery_app/util/localestorage.dart';
import 'package:grocery_app/view/explore/explore.dart';
import 'package:grocery_app/widgets/buy_card.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/product_details_widget.dart';
import 'package:grocery_app/widgets/searchtextformfield.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import '../../constant/colors.dart';
import '../../model/advertisement_model.dart';
import '../../model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final DatabaseService db = DatabaseService();
  double? latitude;
  double? longitude;
  String? address;
  List<Product> _products = [];
  bool _isLoading = true;
  Future<void> _fetchProducts() async {
    List<Product> products = await db.getAllProducts();
    log("message $products");
    setState(() {
      _products = products;
      _isLoading = false;
    });
  }

  Future<void> fetchAndShowAddress() async {
    double? lat = LocalStorageUtils.getLatitude();
    double? long = LocalStorageUtils.getLongitude();

    print("object getlat $lat $lat");

    if (lat != null && long != null) {
      String addr = await getUserAddress(lat, long);
      setState(() {
        latitude = lat;
        longitude = long;
        address = addr;
      });
    } else {
      setState(() {
        address = 'No location data found.';
      });
    }
  }

  Future<String> getUserAddress(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      Placemark place = placemarks[0];
      return "${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      return "Unknown location";
    }
  }

  @override
  void initState() {
    fetchAndShowAddress();
    _fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("object me $latitude $longitude");
    return Scaffold(
      backgroundColor: white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              stretch: true,
              automaticallyImplyLeading: false,
              expandedHeight: 80.h,
              collapsedHeight: 80.h,
              toolbarHeight: 50.h,
              backgroundColor: white,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1,
                collapseMode: CollapseMode.pin,
                titlePadding: EdgeInsets.only(
                  top: 25.h,
                  left: 10.w,
                  bottom: 10.h,
                  right: 10.w,
                ),
                title: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconWidget(
                          icon: Icons.location_on_rounded,
                          color: black,
                        ),
                        SizedBoxWidget(
                          width: 6.w,
                        ),
                        address == null
                            ? TextWidget(
                                text: 'No Location Selected',
                                style: defaultTextstyle.copyWith(
                                  fontSize: 10.sp,
                                ),
                              )
                            : TextWidget(
                                text: address,
                                style: defaultTextstyle.copyWith(
                                  fontSize: 10.sp,
                                ),
                              ),
                      ],
                    ),
                    const SizedBoxWidget(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExploreScreen(),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 35.h,
                        child: IgnorePointer(
                          child: SearchTextFormField(
                            autofocus: false,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 20.h,
                  color: white,
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 15.h,
                    right: 15.w,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200.h,
                padding: EdgeInsets.only(
                  top: 10.h,
                ),
                child: StreamBuilder<List<Advertisement>>(
                  stream: db.getAllAdvertisements(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No advertisements found.'),
                      );
                    }

                    List<Advertisement> ads = snapshot.data!;
                    List<String> allImages =
                        ads.expand((ad) => ad.images).toList();

                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: CarouselSlider.builder(
                            carouselController: _carouselController,
                            itemCount: allImages.length,
                            itemBuilder:
                                (context, int itemIndex, int pageViewIndex) {
                              return Card(
                                margin: EdgeInsets.zero,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(allImages[itemIndex]),
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              autoPlay: true,
                              height: 180,
                              viewportFraction: .8,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DotsIndicator(
                              dotsCount: allImages.length,
                              position: currentIndex,
                              decorator: DotsDecorator(
                                activeColor: Colors.orange,
                                size: const Size.square(9.0),
                                activeSize: const Size(30.0, 9.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ];
        },
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  crossAxisSpacing: 1,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 0.9,
                ),
                padding: const EdgeInsets.all(
                  8,
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  Product product = _products[index];
                  return InkWell(
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
                    child: BuyCardWidget(
                      productName: product.productName.toString(),
                      weight: product.weight.toString(),
                      rs: product.prize,
                      imgUrl: product.imgUrl,
                    ),
                  );
                },
              ),
      ),
    );
  }
}
