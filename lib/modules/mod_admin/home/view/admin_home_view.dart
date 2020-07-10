import 'package:client/core/shared_widgets/bottom_navbar.dart';
import 'package:client/modules/mod_admin/bookings/views/bookings.dart';
import 'package:client/modules/mod_admin/notifications/views/notifications.dart';
import 'package:client/modules/mod_admin/settings/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'home.dart';

class AdminHomeView extends StatefulWidget {
  @override
  _AdminHomeViewState createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
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
                "Home",
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.calendar_o),
              title: Text(
                "Bookings",
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.bell_o),
              title: Text(
                "Notifications",
              )),
          BottomNavigationBarItem(
              icon: Icon(FontAwesome.gear),
              title: Text(
                "Settings",
              )),
        ],
      ),
    );
  }
}
