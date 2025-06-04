import 'package:denta_soft/screens/HomeScreens/FinancialScreens/FinancialScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreens/CalendarScreens/CalendarScreen.dart';
import 'HomeScreens/DashboardScreen.dart';
import 'HomeScreens/PatientScreens/PatientsScreen.dart';
import 'HomeScreens/profile/ProfileScreen.dart';
import 'ThemeColors.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'tabIcon_data.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  _MyHomePageScreenState createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen>
/*with TickerProviderStateMixin */ {
  // AnimationController animationController;

  Widget tabBody = Container(color: ThemeColors.background);
  String homeTitle = "Calendar";

  @override
  void initState() {
    for (var tab in TabIconData.tabIconsList) {
      tab.isSelected = false;
    }
    TabIconData.tabIconsList[0].isSelected = false;

    // animationController = AnimationController(
    //     duration: const Duration(milliseconds: 2000), vsync: this);

    tabBody = CalendarScreen();
    super.initState();
  }

  @override
  void dispose() {
    // animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          elevation: homeTitle.isEmpty ? 0 : 4,
          // backgroundColor: homeTitle.isEmpty ? Colors.white : null,
          title: Text(
            homeTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // backgroundColor: Colors.grey,
        body: Stack(
          children: [
            Column(children: [tabBody]),
            Align(alignment: Alignment.bottomCenter, child: bottomBar()),
          ],
        ),
      ),
    );
  }

  // Widget appBar() {
  //   return SizedBox(
  //     height: AppBar().preferredSize.height,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.only(top: 8, left: 8),
  //           child: Container(
  //             width: AppBar().preferredSize.height - 8,
  //             height: AppBar().preferredSize.height - 8,
  //           ),
  //         ),
  //         Expanded(
  //           child: Center(
  //             child: Padding(
  //               padding: const EdgeInsets.only(top: 4),
  //               child: Text(
  //                 homeTitle,
  //                 style: TextStyle(
  //                   fontSize: 22,
  //                   color: AppTheme.darkText,
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(top: 8, right: 8),
  //           child: Container(
  //             width: AppBar().preferredSize.height - 8,
  //             height: AppBar().preferredSize.height - 8,
  //             color: Colors.white,
  //             child: Container(),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(child: SizedBox()),
        BottomBarView(
          tabIconsList: TabIconData.tabIconsList,
          addClick: () {
            setState(() {
              tabBody = CalendarScreen();
              homeTitle = "Calendar";
            });
            for (var tab in TabIconData.tabIconsList) {
              tab.isSelected = false;
            }
            TabIconData.tabIconsList[0].isSelected = false;
          },
          changeIndex: (int index) {
            switch (index) {
              case 0:
                // animationController.reverse().then<dynamic>((data) {
                //   if (!mounted) {
                //     return;
                //   }
                setState(() {
                  tabBody = FinancialScreen();
                  homeTitle = "Financial";
                });
                // });
                break;
              case 1:
                // animationController.reverse().then<dynamic>((data) {
                //   if (!mounted) {
                //     return;
                //   }
                setState(() {
                  tabBody = DashboardScreen();
                  homeTitle = "Dashboard";
                });
                // });
                break;
              case 2:
                // animationController.reverse().then<dynamic>((data) {
                //   if (!mounted) {
                //     return;
                //   }
                setState(() {
                  tabBody = PatientsScreen();
                  homeTitle = "Patients";
                });
                // });
                break;
              case 3:
                // animationController.reverse().then<dynamic>((data) {
                //   if (!mounted) {
                //     return;
                //   }
                setState(() {
                  tabBody = ProfileScreen();
                  homeTitle = "";
                });
                // });
                break;
              default:
                // animationController.reverse().then<dynamic>((data) {
                //   if (!mounted) {
                //     return;
                //   }
                setState(() {
                  tabBody = CalendarScreen();
                });
              // });
            }
          },
        ),
      ],
    );
  }
}
