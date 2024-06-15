import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/icon_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../util/textstyles.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile({
    super.key,
    required this.leadingicon,
    this.text,
    this.textcolor,
    this.trailingicon,
  });
  final IconData leadingicon;
  final String? text;
  final Color? textcolor;
  final IconData? trailingicon;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconWidget(
        icon: widget.leadingicon,
        size: 22.sp,
      ),
      title: TextWidget(
        text: widget.text,
        style: defaultTextstyle,
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            widget.trailingicon ?? Icons.navigate_next_sharp,
            size: 13.sp,
          )),
    );
  }
}
