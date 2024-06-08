import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/widgets/text_widget.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.textfontsize,
    this.height,
    this.width,
    this.backgroundColor,
    this.buttonRadius,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? textColor;
  final double? textfontsize;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? buttonRadius;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.buttonRadius ?? 12.r),
          ),
        ),
        child: TextWidget(
          text: widget.text,
          color: widget.textColor,
          fontSize: widget.textfontsize ?? 12.sp,
        ),
      ),
    );
  }
}
