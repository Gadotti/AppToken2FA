import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HelpTab extends StatefulWidget {
  final PageController pageController;

  HelpTab({Key key, this.pageController}) : super(key: key);

  @override
  _HelpTabState createState() => _HelpTabState();
}

class _HelpTabState extends State<HelpTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: CustomAppBar(
        titleText: "Ajuda",
      ),
      drawer: CustomDrawer(widget.pageController),
      body: Column(),
    );
  }
}