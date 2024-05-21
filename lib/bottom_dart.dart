import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moniepoint_assignment/helpers.dart';
import 'package:moniepoint_assignment/search_screen.dart';
import 'package:moniepoint_assignment/styles/colors.dart';
import 'package:moniepoint_assignment/widgets/animation_widget/slidein_up_anim.dart';

import 'default_screen.dart';
import 'home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

enum _SelectedTab { search, comment, home, favorite, person }

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  int visit = 2;
  double height = 30;

  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      visit = i;
      _selectedTab = _SelectedTab.values[i];
    });
  }

  List<Widget> pages = [
    SearchScreen(),
    DefaultScreen(title: "Comment"),
    HomeScreen(),
    DefaultScreen(title: "Favourites"),
    DefaultScreen(title: "Profile")
  ];

  @override
  Widget build(BuildContext context) {
    var anim = AnimationController(
      vsync: this,
      value: 1,
      duration: const Duration(milliseconds: 500),
    );
    return Scaffold(
      extendBody: true,
      body: Container(width: deviceWidth(context), child: pages[visit]),
      bottomNavigationBar: SlideInAnimationWidget(
        delay: Duration(seconds: 4),
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: DotNavigationBar(
            currentIndex: _SelectedTab.values.indexOf(_selectedTab),
            dotIndicatorColor: Colors.transparent,
            itemPadding: EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: bottomNavBg,
            borderRadius: 50.0,
            unselectedItemColor: Colors.grey[300],
            splashBorderRadius: 50,
            // enableFloatingNavBar: false,
            onTap: _handleIndexChanged,
            items: [
              /// Home
              DotNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedTab == _SelectedTab.search
                            ? selectedBottomNavItemColor
                            : unselectedBottomNavItemColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/search_icon.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                selectedColor: whiteColor,
              ),

              /// Home
              DotNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedTab == _SelectedTab.comment
                            ? selectedBottomNavItemColor
                            : unselectedBottomNavItemColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/comment_icon.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                selectedColor: whiteColor,
              ),

              /// Home
              DotNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedTab == _SelectedTab.home
                            ? selectedBottomNavItemColor
                            : unselectedBottomNavItemColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/home_Icon.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                selectedColor: whiteColor,
              ),

              /// Home
              DotNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedTab == _SelectedTab.favorite
                            ? selectedBottomNavItemColor
                            : unselectedBottomNavItemColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/favourite_icon.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                selectedColor: whiteColor,
              ),

              /// Home
              DotNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: _selectedTab == _SelectedTab.person
                            ? selectedBottomNavItemColor
                            : unselectedBottomNavItemColor,
                        borderRadius: BorderRadius.circular(25.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        "assets/images/profile_icon.png",
                        height: 20.0,
                        width: 20.0,
                      ),
                    )),
                selectedColor: whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
