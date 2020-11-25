import 'package:AppToken2FA/tabs/help_tab.dart';
import 'package:AppToken2FA/tabs/settings_tab.dart';
import 'package:AppToken2FA/tabs/authorized_systems_tab.dart';
import 'package:AppToken2FA/tabs/token_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  
  final _pageController = PageController();  
  final int _durationSecondsCicle = 5;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: _durationSecondsCicle),      
    );
    
    _pageController.addListener(() {              
      print('>>> page ${_pageController.page.round()}');
      if (_pageController.page.round() > 0) {
        print('>>> _progressController parou');     
        _animationController?.stop();
      }
    });
  }

  @override
  void dispose() {
    //_animationController.dispose(); //Tirado enquanto faz hot reload
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        TokenTab(          
          animationController: _animationController,
          durationSecondsCicle: _durationSecondsCicle,
          pageController: _pageController,
          key: UniqueKey(),
        ),
        AuthorizedSystemsTab(
          pageController: _pageController,
        ),
        SettingsTab(
          pageController: _pageController,
        ),
        HelpTab(
          pageController: _pageController,
        ),
      ],
    );
  }
  
}