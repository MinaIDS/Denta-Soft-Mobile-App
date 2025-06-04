import 'package:flutter/material.dart';

class AccentButton extends StatelessWidget {
  final bool busy;
  final double? width;
  final double height;
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double circular;
  final double fontSize;

  const AccentButton({
    super.key,
    this.busy = false,
    this.width,
    this.height = 50.0,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.circular = 13.0,
    this.fontSize = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: busy ? 60.0 : width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circular),
      ),
      child: busy
          ? Center(
              child: SizedBox(
                width: height - 10,
                height: height - 10,
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                minimumSize: Size(50, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circular),
                ),
              ),
              onPressed: busy ? null : onPressed,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
