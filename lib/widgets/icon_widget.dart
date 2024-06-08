import 'package:flutter/material.dart';

class IconWidget extends StatefulWidget {
  const IconWidget({
    super.key,
    required this.icon,
    this.semanticLabel,
    this.applyTextScaling,
    this.color,
    this.fill,
    this.grade,
    this.opticalSize,
    this.shadows,
    this.size,
    this.textDirection,
    this.weight,
  });
  final IconData? icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticLabel;
  final TextDirection? textDirection;
  final bool? applyTextScaling;

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.icon,
      color: widget.color,
      size: widget.size,
    );
  }
}
