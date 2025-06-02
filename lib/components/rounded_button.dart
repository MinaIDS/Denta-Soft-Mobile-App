import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:denta_soft/widgets/buttons/accent_button.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final bool busy;
  final VoidCallback? press; // Use VoidCallback instead of Function
  final Color color, textColor;

  const RoundedButton({
    Key? key, // Mark Key as nullable since it's optional in the constructor
    required this.text, // Make text required
    required this.busy, // Make busy required
    this.press, // Make press required
    this.color = ThemeColors.primary,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: AccentButton(
          busy: busy,
          text: text,
          color: color,
          onPressed: press!,
        ),
      ),
    );
  }
}
