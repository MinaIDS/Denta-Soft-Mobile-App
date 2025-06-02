import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child; // Make child nullable

  const TextFieldContainer({
    Key? key, // Mark key as nullable
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: ThemeColors.light_primary,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
