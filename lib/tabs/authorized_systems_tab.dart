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
        titleText: 'Sistemas autorizados',
      ),
      drawer: CustomDrawer(pageController: widget.pageController),
      body: ListView(
        padding: EdgeInsets.only(top: 10, left: 5, right: 5),
        children: [
          AuthorizedSystemTile(systemName: 'Sistema teste A', login: 'eduardo.gadotti',  lastLogin: '24/11/2020 14:32:22'),
          AuthorizedSystemTile(systemName: 'Sistema teste B', login: 'eduardo123',  lastLogin: '26/11/2020 12:10:56'),
          AuthorizedSystemTile(systemName: 'Sistema teste C', login: 'gadotti064',  lastLogin: '20/10/2020 07:13:01'),
        ],
      ),
    );
  }
}