import 'package:denta_soft/screens/ThemeColors.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static AppBar customAppBar({
    required String title,
    double elevations = 4,
    PreferredSizeWidget? bottom,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: ThemeColors.primary),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ThemeColors.primary,
          fontWeight: FontWeight.w200,
        ),
      ),
      bottom: bottom,
    );
  }
}
