import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<BottomNavigationBarItem> navItems;

  const BottomNavBar({Key key, this.currentIndex, this.onTap, this.navItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          //Platform.isAndroid ?
          kBottomNavigationBarHeight + 8,
      //: 77,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: Theme.of(context).accentColor,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: currentIndex,
              iconSize: 16,
              unselectedItemColor: Colors.white54,
              selectedItemColor: Colors.white,
              onTap: onTap,
              items: navItems),
        ),
      ),
    );
  }
}
