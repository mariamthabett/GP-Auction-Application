import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:philo_task/presentation/screens/profile/screens/profile_screen.dart';

import '../screens/Favorites/presentation/pages/favourites_view.dart';
import '../screens/home/home_view.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({super.key});

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  int _page = 0;
  int indexNow = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget?> pages = [
      HomeView(),
      FavouritesView(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: getBottomNavigationBar(
          key: _bottomNavigationKey,
          index: indexNow,
          onTap: (index) {
            setState(() {
              _page = index;
            });
          }),
      extendBody: true,
      body: Container(child: pages[_page]),
    );
  }
}

Widget getBottomNavigationBar({
  required GlobalKey key,
  void Function(int)? onTap,
  int index = 2,
}) {
  return CurvedNavigationBar(
    backgroundColor: const Color.fromARGB(255, 247, 247, 248),
    color: Color.fromARGB(255, 115, 183, 239),
    key: key,
    index: index,
    height: 55.0,
    items: const [
      Icon(Icons.home),
      Icon(Icons.favorite),
      Icon(Icons.person),
    ],
    animationCurve: Curves.easeInOut,
    animationDuration: const Duration(milliseconds: 500),
    onTap: onTap,
  );
}
