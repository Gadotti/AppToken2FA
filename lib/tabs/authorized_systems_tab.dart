import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:AppToken2FA/tiles/authorized_system_tile.dart';
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
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        children: [
          AuthorizedSystemTile(systemName: "Sistema empresa A"),
          AuthorizedSystemTile(systemName: "Sistema empresa B"),
          AuthorizedSystemTile(systemName: "Sistema empresa C"),
        ],
      ),
    );
  }
}