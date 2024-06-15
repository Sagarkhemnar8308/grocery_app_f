import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/util/textstyles.dart';

class TextformFieldWidget extends StatefulWidget {
  const TextformFieldWidget({
    super.key,
    this.hintText,
    this.height,
    this.rouneded = 5.0,
    this.fontWeight,
    this.focusNode,
    this.suffixIcon,
    this.isSuffixIconShow = false,
    this.isRounded = true,
    this.backgroundColor,
    this.controller,
    this.textInputType,
    this.inputFormater,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.isBorderColor = true,
    this.obscureText,
    this.hintTextColor,
    this.textColor,
    this.fontSize,
    this.maxLine,
    this.labeltext,
    this.hintStyle,
  });

  final String? initialValue;
  final String? hintText;
  final int? maxLine;
  final bool isSuffixIconShow;
  final double? height;
  final double rouneded;
  final bool isRounded;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? labeltext;
  final TextStyle? hintStyle;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.rouneded),
      ),
      height: widget.height,
      child: TextFormField(
          maxLines: widget.maxLine ?? 1,
          obscureText: widget.obscureText ?? false,
          initialValue: widget.initialValue,
          cursorColor: const Color.fromARGB(255, 127, 126, 126),
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          autofocus: false,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: textEditingStyle,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.h),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            suffixIcon: widget.suffixIcon,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: const Color(0XFFAFAFAF),
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: const Color(0XFFAFAFAF),
            )),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: const Color(0XFFAFAFAF),
              ),
            ),
          )),
    );
  }
}
