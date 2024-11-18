import 'package:flutter/material.dart';
import 'package:mobile_qlcv/presentation/canhan/pages/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import '../../presentation/home/pages/home_page.dart';

class NavigationBar extends StatelessWidget {
  final PersistentTabController controller;

  NavigationBar({super.key, required this.controller});

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      Container(), // Placeholder for 3rd page
      Container(), // Placeholder for 4th page
      Container(), // Placeholder for 5th page
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.insert_chart_outlined_rounded),
        title: "Dashboard",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_rounded),
        title: "Tìm kiếm",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "Tạo công việc",
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.grey,
        activeColorSecondary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.menu_open_rounded),
        title: "Danh mục",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Cá nhân",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
      confineToSafeArea: true,
      backgroundColor: Colors.grey.shade100,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
      padding: const EdgeInsets.all(8),
      isVisible: true,
      navBarHeight: 60,
      // animationSettings: const NavBarAnimationSettings(
      //   navBarItemAnimation: ItemAnimationSettings(
      //     // Navigation Bar's items animation properties.
      //     duration: Duration(milliseconds: 400),
      //     curve: Curves.ease,
      //   ),
      //   screenTransitionAnimation: ScreenTransitionAnimationSettings(
      //     // Screen transition animation on change of selected tab.
      //     animateTabTransition: true,
      //     duration: Duration(milliseconds: 200),
      //     screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
      //   ),
      // ),
      // onItemSelected: (index) {
      //   // Handle item selection if necessary
      // },
    );
  }
}
