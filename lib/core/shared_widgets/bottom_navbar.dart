
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
          kBottomNavigationBarHeight,
      //: 77,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        color: Colors.white,
        child: BottomNavigationBar(
        
            backgroundColor: Colors.transparent,
            elevation: 0,
            currentIndex: currentIndex,
            iconSize: 16,
            unselectedItemColor: Theme.of(context).accentColor,
            selectedItemColor: Theme.of(context).primaryColor,
            onTap: onTap,
            items: navItems),
      ),
    );
  }
}
