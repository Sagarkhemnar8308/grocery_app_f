import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/constant/images.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/sizedbox_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../../widgets/customlisttile.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundImage: AssetImage(manBackgroundimg),
                  ),
                  SizedBoxWidget(
                    width: 20.w,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: 'text',
                          ),
                          SizedBoxWidget(
                            width: 10,
                          ),
                          IconWidget(icon: Icons.edit)
                        ],
                      ),
                      TextWidget(
                        text: 'text',
                      ),
                    ],
                  )
                ],
              ),
              const CustomListTile(
                leadingicon: Icons.shopify_rounded,
                text: 'Orders',
              ),
              const CustomListTile(
                leadingicon: Icons.insert_drive_file_outlined,
                text: 'My Details',
              ),
              const CustomListTile(
                leadingicon: Icons.location_on,
                text: 'Delivery Address',
              ),
              const CustomListTile(
                leadingicon: Icons.notifications_active,
                text: 'Notification',
              ),
              const CustomListTile(
                leadingicon: Icons.help,
                text: 'Helps',
              ),
              const CustomListTile(
                leadingicon: Icons.info,
                text: 'About',
              ),
              SizedBoxWidget(
                height: 50.h,
              ),
              Container(
                height: 40.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconWidget(
                      icon: Icons.logout,
                      color: primaryColor,
                    ),
                    SizedBoxWidget(
                      width: 10.w,
                    ),
                    TextWidget(
                      text: 'Log Out',
                      color: primaryColor,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
