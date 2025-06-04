import 'dart:convert';

import 'package:denta_soft/utils/FCM/FCM.dart';
import 'package:denta_soft/utils/assets_routes.dart';
import 'package:flutter/material.dart';

import '../models/AccountModel.dart';
import '../utils/GlobalData.dart';
import '../utils/GoTo.dart';
import '../utils/SharedPrafrance/SharedPrafranceKeys.dart';
import '../utils/SharedPrafrance/SharedPrafranceManager.dart';
import '../utils/SizeandStyleUtills.dart';
import 'AccountScreens/login_screen.dart';
import 'Widget/bezierContainer.dart';
import 'home_index.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    //check if login
    handleData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    SizeandStyleUtills().updateScreenDimesion(height: height, width: width);
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedOpacity(
                      duration: Duration(seconds: 6),
                      opacity: opacityLevel,
                      curve: Curves.bounceOut,
                      onEnd: () {},
                      child: Image.asset(
                        AssetsRoutes.logo,
                        width: MediaQuery.of(context).size.width * .6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //            Image.asset('assets/images/smallLogo.png'),
          ],
        ),
      ),
    );
  }

  void handleData(BuildContext context) async {
    //start FCM
    FCM().startFCM();

    await Future.delayed(Duration(seconds: 1));
    _changeOpacity();
    await Future.delayed(Duration(seconds: 8));
    try {
      if (await SharedPrafranceManager().isContainsKey(
        SecureStorageKeys.accountData,
      )) {
        String s = await SharedPrafranceManager().getData(
          SecureStorageKeys.accountData,
        );
        GlobalData.accountData = AccountModel.fromJson(json.decode(s));
        GoTo.replaceScreen(context, HomeIndex());
      } else {
        GoTo.replaceScreen(context, LoginScreen());
      }
    } catch (e) {
      GoTo.replaceScreen(context, LoginScreen());
    }
  }
}
