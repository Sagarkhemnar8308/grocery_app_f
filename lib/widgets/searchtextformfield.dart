import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/constant/colors.dart';
import 'package:grocery_app/widgets/icon_widget.dart';

// ignore: must_be_immutable
class SearchTextFormField extends StatefulWidget {
   SearchTextFormField({
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
    this.onTap,
    this.labeltext,
    required this.autofocus,
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
  final void Function()? onTap;
   bool autofocus=false;
  @override
  State<SearchTextFormField> createState() => _SearchtextFormFieldState();
}

class _SearchtextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.grey.shade300,
        borderRadius:
            widget.isRounded ? BorderRadius.circular(widget.rouneded) : null,
      ),
      height: widget.height,
      child: TextFormField(
          maxLines: widget.maxLine ?? 1,
          obscureText: widget.obscureText ?? false,
          initialValue: widget.initialValue,
          cursorColor: black,
          onTap:widget.onTap ,
          inputFormatters: widget.inputFormater,
          keyboardType: widget.textInputType,
          autofocus: widget.autofocus,
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
            hintText: "Search Store",
            prefixIcon: const IconWidget(icon: Icons.search,),
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
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          )),
    );
  }
}
