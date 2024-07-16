import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t89/src/presentation/screen/achievements_screen/achievements_screen.dart';
import 'package:t89/src/presentation/screen/home_view/home_view.dart';
import 'package:t89/src/presentation/screen/product_screen/product_screen.dart';
import 'package:t89/src/presentation/screen/statistics_screen/statistics_screen.dart';
import 'package:t89/src/presentation/screen/settings_screen/settings_screen.dart';

class NavbarView extends StatefulWidget {
  const NavbarView({super.key});

  @override
  State<NavbarView> createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  @override
  void initState() {
    super.initState();
    
  }
  int _currentIndex = 0;
  final List<Widget> views = [
    const HomeView(),
    const ProductScreen(),
    const StatisticsScreen(),
    AchievementsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[_currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFDD6F31),
        unselectedItemColor: Colors.black,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFDD6F31),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/main.svg',
              height: 35,
            ),
            activeIcon: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 239, 219, 208),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  'assets/icons/main_ac.svg',
                  height: 35,
                ),
              ),
            ),
            label: 'Main',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/bage.svg',
              height: 35,
            ),
            activeIcon: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 239, 219, 208),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  'assets/icons/bag.svg',
                  height: 35,
                ),
              ),
            ),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/static.svg',
              height: 35,
            ),
            activeIcon: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 239, 219, 208),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  'assets/icons/chart.svg',
                  height: 35,
                ),
              ),
            ),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/ranking1.svg',
              height: 35,
            ),
            activeIcon: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 239, 219, 208),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SvgPicture.asset(
                  'assets/icons/ranking.svg',
                  height: 35,
                ),
              ),
            ),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              height: 35,
            ),
            activeIcon: Container(
              width: 42,
              height: 42,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 239, 219, 208),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Icon(
                Icons.settings,
                color: Color(0xFFE0966D),
                size: 35,
              ),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
