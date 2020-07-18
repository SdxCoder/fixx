import 'package:client/core/shared_widgets/bottom_navbar.dart';
import 'package:client/modules/mod_admin/bookings/views/bookings.dart';
import 'package:client/modules/mod_admin/notifications/views/notifications.dart';
import 'package:client/modules/mod_admin/settings/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'home.dart';

class UserHomeView extends StatefulWidget {
  @override
  _UserHomeViewState createState() => _UserHomeViewState();
}

class _UserHomeViewState extends State<UserHomeView> {
  int _currentIndex = 0;

  List<Widget> pages = [
   Home(),
   BookingsView(),
   NotificationsView(),
   SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        navItems: [
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.home),
              title: Text(
                "Explore",
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.calendar_o),
              title: Text(
                "Bookings",
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.user_o),
              title: Text(
                "Profile",
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text(
                "Favourites",
              )),
        ],
      ),
    );
  }
}