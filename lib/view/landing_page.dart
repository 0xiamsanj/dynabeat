import 'package:dynabeat/controller/navigation_controller.dart';
import 'package:dynabeat/view/home_page.dart';
import 'package:dynabeat/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';

class LandingPage extends StatelessWidget {
  final _navBarCtrl = Get.put(NavigationController());

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildNavigationBar(),
      backgroundColor: const Color(0xff161A1A),
      body: Obx(() {
        return IndexedStack(
          index: _navBarCtrl.tabIndex.value,
          children: [HomePage(), SearchPage()],
        );
      }),
    );
  }

  _buildNavigationBar() {
    return GNav(
      tabs: const [
        GButton(
          icon: Iconsax.home,
          text: 'Home',
        ),
        GButton(
          icon: Iconsax.heart,
          text: 'Likes',
        ),
        GButton(
          icon: Iconsax.search_favorite,
          text: 'Search',
        ),
        GButton(
          icon: Iconsax.user,
          text: 'Profile',
        )
      ],
      onTabChange: (index) {
        _navBarCtrl.tabIndexChange(index);
      },
      gap: 5,
      color: Colors.grey,
      activeColor: Colors.purple.shade100,
      style: GnavStyle.google,
      tabMargin: const EdgeInsets.symmetric(vertical: 7),
    );
  }
}
