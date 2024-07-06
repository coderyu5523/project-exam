import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_account/screens/record_screen.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({super.key});

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          RecordScreen()
          // NeighborhoodLifeScreen(),
          // NearMeScreen(),
          // MyCarrotScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "일일", icon: Icon(FontAwesomeIcons.book)),
          BottomNavigationBarItem(
              label: "통계", icon: Icon(FontAwesomeIcons.chartBar)),
          BottomNavigationBarItem(
              label: "결산", icon: Icon(FontAwesomeIcons.coins)),
        ],
      ),
    );
  }
}
