import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback
      onPressed; // Use VoidCallback for onPressed as it's a function that takes no arguments and returns nothing.
  final Color textColor;
  final double fontSize;

  const CustomTextButton({
    Key? key, // key can be nullable
    required this.text, // text is now required
    required this.onPressed, // onPressed is now required
    this.textColor = Colors.blue, // Default value for textColor
    this.fontSize = 16, // Default value for fontSize
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: textColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
