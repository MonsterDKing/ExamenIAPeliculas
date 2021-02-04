import 'package:examenia/provider/TapBarProvider.dart';
import 'package:examenia/ui/Widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TapBarView extends StatefulWidget {
  @override
  _TapBarViewState createState() => _TapBarViewState();
}

class _TapBarViewState extends State<TapBarView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabBarProvider = Provider.of<TapBarProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(tabBarProvider.getListTitle[tabBarProvider.getTabIndex]),
      ),
      body: tabBarProvider.getListScreens[tabBarProvider.getTabIndex],
      bottomNavigationBar: TapBarWidget(tabBarProvider: tabBarProvider),
      // backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
