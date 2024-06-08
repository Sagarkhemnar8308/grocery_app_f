import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWidget extends StatefulWidget {
  const TextWidget({
    super.key,
   required this.text,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.letterSpacing,
    this.textOverflow,
    this.textDecoration,
  });
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? color;
  final TextAlign? textAlign;
  final double? letterSpacing;
  final TextOverflow? textOverflow;

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: widget.textAlign,
      widget.text ?? "",
      overflow: widget.textOverflow,
      style: TextStyle(
        decoration: widget.textDecoration,
        fontSize: widget.fontSize ?? 12.sp,
        fontWeight: widget.fontWeight,
        color: widget.color,
        letterSpacing: widget.letterSpacing,
      ),
    );
  }
}
