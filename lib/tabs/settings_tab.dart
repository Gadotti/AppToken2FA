import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';

class SettingsTab extends StatefulWidget {

  final PageController pageController;

  SettingsTab({Key key, this.pageController}) : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: CustomAppBar(
        titleText: "Preferências",
      ),
      drawer: CustomDrawer(widget.pageController),
      body: Column(),
    );
  }
}