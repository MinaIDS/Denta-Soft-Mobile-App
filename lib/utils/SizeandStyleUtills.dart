import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SizeandStyleUtills {
  factory SizeandStyleUtills() {
    return _singleton;
  }

  static final SizeandStyleUtills _singleton = SizeandStyleUtills._internal();

  SizeandStyleUtills._internal();

  //region Screen Size and Proportional according to device
  double? _screenHeight; // Make _screenHeight nullable
  double? _screenWidth; // Make _screenWidth nullable

  double get screenHeight =>
      _screenHeight!; // Use ! to indicate these values should be set before use
  double get screenWidth =>
      _screenWidth!; // Use ! to indicate these values should be set before use

  final double _refrenceScreenHeight = 683.4285714285714;
  final double _refrenceScreenWidth = 411.42857142857144;

  // Update the screen dimensions with nullable parameters
  void updateScreenDimesion({double? width, double? height}) {
    _screenWidth =
        width ?? _screenWidth; // If width is null, keep the current value
    _screenHeight =
        height ?? _screenHeight; // If height is null, keep the current value
  }

  // Get proportional height based on the screen size
  double getProportionalHeight({required double height}) {
    return _screenHeight! * height / _refrenceScreenHeight;
  }

  // Get proportional width based on the screen size
  double getProportionalWidth({required double width}) {
    var w = _screenWidth! * width / _refrenceScreenWidth;
    return w.ceilToDouble();
  }

  //endregion

  //region TextStyle
  TextStyle getTextStyleRegular({
    FontWeight? fontWeight,
    String fontName = 'Almarai',
    int fontsize = 16,
    Color? color,
    bool isChangeAccordingToDeviceSize = true,
    double? characterSpacing,
    double? lineSpacing,
  }) {
    double finalFontsize = fontsize.toDouble();
    if (isChangeAccordingToDeviceSize) {
      finalFontsize = (finalFontsize * _screenWidth!) / _refrenceScreenWidth;
    }
    return GoogleFonts.tajawal(
      fontSize: finalFontsize,
      color: color,
      fontWeight: fontWeight,
      letterSpacing: characterSpacing,
      height: lineSpacing,
    );
  }
  //endregion
}
