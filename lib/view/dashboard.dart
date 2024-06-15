import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/view/cart/cartscreen.dart';
import 'package:grocery_app/view/explore/explore.dart';
import 'package:grocery_app/view/favorite/favorite_screen.dart';

import 'account/account.dart';
import 'homescreen/homescreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Widget currentPage;
  List<Widget> pages = [];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeScreen homePage = const HomeScreen();
  ExploreScreen exploreScreen = const ExploreScreen();
  CartScreen cartScreen = const CartScreen();
  FavoriteScreen favoriteScreen = const FavoriteScreen();
  AccountScreen account = const AccountScreen();
  int currentIndex = 0;

  @override
  void initState() {
    pages = [homePage, exploreScreen, cartScreen, favoriteScreen, account];
    currentPage = pages[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: TextStyle(
          color: primaryColor
        ),
          onTap: (value) {
            setState(() {
              currentIndex = value;
              currentPage = pages[value];
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              label: 'Shop',
              icon: Icon(
                Icons.shopify,
                color: currentIndex == 0 ? primaryColor : black,
                size: 25.sp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Explore',
              icon: Icon(
                Icons.search,
                size: 25.sp,
                color: currentIndex == 1 ? primaryColor : black,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_cart_checkout_outlined,
                color: currentIndex == 2 ? primaryColor : black,
                size: 25.sp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Favorite',
              icon: Icon(
                Icons.favorite_border_outlined,
                color: currentIndex == 3 ? primaryColor : black,
                size: 25.sp,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(
                Icons.account_circle_outlined,
                color: currentIndex == 4 ? primaryColor : black,
                size: 25.sp,
              ),
            ),
          ]),
    );
  }
}
