import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_account/ui/pages/record_page/record_page.dart';
import '../_common/custom_app_bar.dart';
import '../_common/custom_bottom_navigation_bar.dart';
import 'asset_page/asset_page.dart';
import 'chart_page/chart_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "가계부"), // CustomAppBar 사용
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          RecordPage(),
          ChartPage(),
          AssetPage()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
