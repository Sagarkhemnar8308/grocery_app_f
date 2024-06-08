import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/widgets/buy_card.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/searchtextformfield.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              SizedBoxWidget(
                height: 30.h,
              ),
              IconWidget(
                icon: Icons.local_grocery_store_outlined,
                size: 50.sp,
                color: black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconWidget(
                    icon: Icons.location_on_rounded,
                    color: black,
                  ),
                  const TextWidget(
                    text: 'Ambhore,banassre',
                  ),
                ],
              ),
              const SearchTextFormField(),
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: CarouselSlider.builder(
                    carouselController: _carouselController,
                    itemCount: 2,
                    itemBuilder: (context, int itemIndex, int pageViewIndex) {
                      return Card(
                        margin: EdgeInsets.zero,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(manBackgroundimg),
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
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DotsIndicator(
                    dotsCount: 3,
                    position: currentIndex,
                    decorator: DotsDecorator(
                      activeColor: Colors.orange,
                      size: const Size.square(
                        9.0,
                      ),
                      activeSize: const Size(
                        18.0,
                        9.0,
                      ),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ])),
      ),
    );
  }
}
