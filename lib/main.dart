import 'dart:io';

import 'package:denta_soft/controllers/TreatmentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'controllers/FinancialController.dart';
import 'controllers/UsersScreenController.dart';
import 'controllers/mCalendarController.dart';
import 'generated/l10n.dart';
import 'screens/HomeScreens/PatientScreens/Tabs/MedicalRecordTab.dart';
import 'screens/SplashScreen.dart';
import 'screens/app_theme.dart';
import 'utils/localization/Localizations.dart';
import 'utils/localization/app_language.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  // // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // hide landscape
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // // get Language from sharedPrafrance
  final AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Platform.isAndroid
            ? Brightness.dark
            : Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.grey,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(create: (context) => AppLanguage()),
        ChangeNotifierProvider<SelectProductsProvider>(
          create: (context) => SelectProductsProvider(),
        ),
        ChangeNotifierProvider<MCalendarController>(
          create: (context) => MCalendarController(),
        ),
        ChangeNotifierProvider<FinancialController>(
          create: (context) => FinancialController(),
        ),
        ChangeNotifierProvider<UsersScreenController>(
          create: (context) => UsersScreenController(),
        ),
        ChangeNotifierProvider<TreatmentController>(
          create: (context) => TreatmentController(),
        ),
      ],
      child: Consumer<AppLanguage>(
        builder: (context, appLanguage, child) => MaterialApp(
          title: 'Home',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: AppTheme.textTheme,
            fontFamily: 'Tajawal',
            platform: TargetPlatform.iOS,
            scaffoldBackgroundColor: Colors.white,
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: Colors.transparent,
            ),
          ),
          locale: appLanguage.appLocal,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            AppLocalizations.delegate,
            SfGlobalLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: SplashScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
