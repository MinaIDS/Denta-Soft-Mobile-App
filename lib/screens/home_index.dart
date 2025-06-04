import 'package:denta_soft/generated/l10n.dart';
import 'package:denta_soft/screens/Widget/custom_appBar.dart';
import 'package:denta_soft/utils/GlobalData.dart';
import 'package:flutter/material.dart';

import 'DrawerScreens/app_drawer.dart';
import 'HomeScreens/CalendarScreens/CalendarScreen.dart';
import 'HomeScreens/DashboardScreen.dart';
import 'HomeScreens/FinancialScreens/FinancialScreen.dart';
import 'HomeScreens/PatientScreens/PatientsScreen.dart';
import 'HomeScreens/profile/ProfileScreen.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  int pageNumber = 2;
  final _pageController = PageController(initialPage: 2);
  final List<Widget> _pages = [
    FinancialScreen(),
    DashboardScreen(),
    CalendarScreen(),
    PatientsScreen(),
    ProfileScreen(),
  ];

  final appBarTitle = [
    S().Financial, //'Financial',
    S().Dashboard, //'Dashboard',
    S().Calender, //'Calender',
    S().Patients, //'Patients',
  ];

  @override
  Widget build(BuildContext context) {
    GlobalData.globalContext = context;
    return Scaffold(
      appBar: (pageNumber == 4 || pageNumber == 3)
          ? null
          : CustomAppBar.customAppBar(title: appBarTitle[pageNumber]),
      drawer: AppDrawer(),
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: buildBottomNavigationBar(),
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: (index) {
        setState(() {
          pageNumber = index;
        });
        _pageController.jumpToPage(index);
      },
      currentIndex: pageNumber,
      type: BottomNavigationBarType.fixed,
      unselectedLabelStyle: const TextStyle(fontSize: 10, height: 1.5),
      selectedLabelStyle: const TextStyle(fontSize: 11, height: 1.5),
      selectedIconTheme: const IconThemeData(color: Colors.blue, size: 28),
      selectedItemColor: Colors.blue,
      iconSize: 24,
      items: <BottomNavigationBarItem>[
        _buildTab(
          'assets/fitness_app/tab_1.png',
          'assets/fitness_app/tab_1s.png',
          'Financial',
        ),
        _buildTab(
          'assets/fitness_app/tab_2.png',
          'assets/fitness_app/tab_2s.png',
          'Dashboard',
        ),
        _buildTab(
          'assets/fitness_app/calender.png',
          'assets/fitness_app/calender_s.png',
          'Calendar',
        ),
        _buildTab(
          'assets/fitness_app/tab_3.png',
          'assets/fitness_app/tab_3s.png',
          'Patients',
        ),
        _buildTab(
          'assets/fitness_app/tab_4.png',
          'assets/fitness_app/tab_4s.png',
          'Profile',
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildTab(
    String icon,
    String activeicon,
    String title,
  ) {
    return BottomNavigationBarItem(
      activeIcon: Image.asset(activeicon, width: 40),
      icon: Image.asset(icon, width: 40),
      label: title,
    );
  }
}
