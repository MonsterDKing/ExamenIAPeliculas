import 'package:examenia/provider/TapBarProvider.dart';
import 'package:examenia/ui/ComplexView.dart';
import 'package:examenia/ui/ProfileView.dart';
import 'package:examenia/ui/BillboardView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapBarView extends StatefulWidget {
  @override
  _TapBarViewState createState() => _TapBarViewState();
}

class _TapBarViewState extends State<TapBarView> {
  List<Widget> listScreens;

  @override
  void initState() {
    super.initState();
    listScreens = [
      ProfileView(),
      BillboardView(),
      ComplexView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final tabBarProvider = Provider.of<TapBarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tabBarProvider.getListTitle[tabBarProvider.getTabIndex]),
      ),
      body: listScreens[tabBarProvider.getTabIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: tabBarProvider.getTabIndex,
          onTap: (int index) {
            tabBarProvider.setTabIndex(index);
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
          ]),
      // backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
