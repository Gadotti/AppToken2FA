import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';

class AuthorizedSystemsTab extends StatefulWidget {

  final PageController pageController;

  AuthorizedSystemsTab({Key key, this.pageController}) : super(key: key);

  @override
  _AuthorizedSystemsTabState createState() => _AuthorizedSystemsTabState();
}

class _AuthorizedSystemsTabState extends State<AuthorizedSystemsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: CustomAppBar(
        titleText: "Sistemas autorizados",
      ),
      drawer: CustomDrawer(widget.pageController),
      body: Column(),
    );
  }
}