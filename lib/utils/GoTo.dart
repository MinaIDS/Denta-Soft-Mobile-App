import 'package:flutter/material.dart';

import 'GlobalData.dart';

class GoTo {
  // go to screen and pass data to constractor
  static Future screen(BuildContext context, dynamic screen) {
    GlobalData.globalContext = context;
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  // go to screen and remove until and pass data to constractor
  static void screenAndRemoveUntil(BuildContext context, dynamic screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
    GlobalData.globalContext = context;
  }

  // go to replace Screen and pass data to constractor
  static void replaceScreen(BuildContext context, dynamic screen) {
    Route route = MaterialPageRoute(builder: (context) => screen);
    Navigator.pushReplacement(context, route);
    GlobalData.globalContext = context;
  }
}
