import 'package:flutter/material.dart';

class FieldHeader extends StatelessWidget {
  final String title;
  final Color textColor;
  final bool isRequired;
  const FieldHeader(
    this.title, {
    super.key,
    this.isRequired = false,
    this.textColor = Colors.black54,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: textColor, fontSize: 14),
        children: [
          TextSpan(text: title),
          if (isRequired) ...[
            TextSpan(text: '  '),
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ],
      ),
    );
  }
}
