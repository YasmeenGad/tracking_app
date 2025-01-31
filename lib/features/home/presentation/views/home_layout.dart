import 'package:flowery_delivery/core/styles/colors/my_colors.dart';
import 'package:flowery_delivery/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text('Home Screen')),
    Center(child: Text('Check Order Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.baseColor,
        unselectedItemColor: MyColors.white80,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesHome)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesCheckorders)),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(Assets.imagesProfilenav)),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
