
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cataloge/organization/appointment.dart';
import 'package:flutter_cataloge/organization/home.dart';
import 'package:flutter_cataloge/organization/profile.dart';
import 'package:flutter_cataloge/page/Donate.dart';
import 'package:flutter_cataloge/page/Profile.dart';
import 'package:flutter_cataloge/page/Request.dart';
import 'package:flutter_cataloge/page/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class organizationApp extends StatefulWidget {
  const organizationApp({super.key});

  @override
  State<organizationApp> createState() => _organizationAppState();
}

class _organizationAppState extends State<organizationApp> {
  final _pages = [homePageOrganization() , appointment() , profileorganization()];
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      backgroundColor: Colors.redAccent,
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeIn,
      ),
      decoration: NavBarDecoration(
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2)))),
      screens: _pages,
      items: [
        PersistentBottomNavBarItem(
          icon: Icon(
            CupertinoIcons.house,
          ),
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
          activeColorPrimary: Colors.black,
          title: "Home",
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.request_page_rounded,
          ),
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
          activeColorPrimary: Colors.black,
          title: "Appointment",
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.person_sharp,
          ),
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white,
          activeColorPrimary: Colors.black,
          title: "Profile",
        ),
      ],
      controller: _controller,
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: false,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      navBarStyle: NavBarStyle.style10,
    );
  }
}