import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    required this.text,
    required this.colour,
    super.key,
    this.fontSize,
    this.height,
  });

  final String text;
  final Color colour;
  final double? height;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        height: height ?? 1.2,
        fontSize: fontSize ?? 12,
      ),
    );
  }
}
