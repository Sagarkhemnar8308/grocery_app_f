import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';

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
  final String? suffixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormater;
  final bool? isBorderColor;
  final bool? obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? labeltext;
  @override
  State<TextformFieldWidget> createState() => _TextformFieldWidgetState();
}

class _TextformFieldWidgetState extends State<TextformFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      child: TextFormField(
          maxLines: widget.maxLine ?? 1,
          obscureText: widget.obscureText ?? false,
          initialValue: widget.initialValue,
          cursorColor: black,
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          autofocus: false,
          controller: widget.controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          validator: widget.validator,
          style: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.textColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.h),
            hintText: widget.hintText,
            labelText: widget.labeltext,
            labelStyle: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.hintTextColor,
            ),
            hintStyle: TextStyle(
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              color: widget.hintTextColor,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: black,
            )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              width: 1.w,
              color: black,
            )),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                width: 1.w,
                color: black,
              ),
            ),
          )),
    );
  }
}
