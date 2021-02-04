import 'package:examenia/provider/TapBarProvider.dart';
import 'package:flutter/material.dart';

class TapBarWidget extends StatelessWidget {
  const TapBarWidget({
    Key key,
    @required this.tabBarProvider,
  }) : super(key: key);

  final TapBarProvider tabBarProvider;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: tabBarProvider.getTabIndex,
        onTap: (int index) {
          tabBarProvider.setTabIndex = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(),
            label: tabBarProvider.getListTitle[0],
          ),
          BottomNavigationBarItem(
              icon: Container(), label: tabBarProvider.getListTitle[1]),
          BottomNavigationBarItem(
              icon: Container(), label: tabBarProvider.getListTitle[2]),
        ]);
  }
}
