import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:flutter/material.dart';

class SocalIcon extends StatelessWidget {
  final String iconSrc;
  final VoidCallback press; // Use VoidCallback instead of Function

  const SocalIcon({
    Key? key, // Mark key as nullable
    required this.iconSrc, // Make iconSrc required
    required this.press, // Make press required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ThemeColors.dark),
          shape: BoxShape.circle,
        ),
        child: Image.asset(iconSrc, height: 20, width: 20),
      ),
    );
  }
}
