import 'package:flutter/material.dart';
import 'package:fligh_ticket_dealer/main.dart';

class CustomBottomBar extends StatefulWidget {
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<BottomNavigationBarItem> items = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _synAllNavigationItems();
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
      items: items,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
    );
  }

  void _synAllNavigationItems() {
    items = [
      BottomNavigationBarItem(
          title: Text(
            'Explore',
            style: TextStyle(
                color: this.selectedIndex == 0 ? firstColor : Colors.black),
          ),
          icon: Icon(Icons.home, color: Colors.black),
          activeIcon: Icon(
            Icons.home,
            color: firstColor,
          )),
      BottomNavigationBarItem(
          title: Text(
            'Watchlist',
            style: TextStyle(
                color: this.selectedIndex == 1 ? firstColor : Colors.black),
          ),
          icon: Icon(Icons.favorite, color: Colors.black),
          activeIcon: Icon(
            Icons.favorite,
            color: firstColor,
          )),
      BottomNavigationBarItem(
          title: Text(
            'Deals',
            style: TextStyle(
                color: this.selectedIndex == 2 ? firstColor : Colors.black),
          ),
          icon: Icon(Icons.dashboard, color: Colors.black),
          activeIcon: Icon(
            Icons.dashboard,
            color: firstColor,
          )),
      BottomNavigationBarItem(
          title: Text(
            'Notifications',
            style: TextStyle(
                color: this.selectedIndex == 3 ? firstColor : Colors.black),
          ),
          icon: Icon(Icons.notifications, color: Colors.black),
          activeIcon: Icon(
            Icons.notifications,
            color: firstColor,
          ))
    ];
  }
}
