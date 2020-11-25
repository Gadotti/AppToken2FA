import 'package:AppToken2FA/screens/initial_config_screen.dart';
import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final AnimationController animationController;
  final int page;
  final bool disconnect;

  DrawerTile({@required this.icon, @required this.text, this.pageController, this.page = 0, this.animationController, this.disconnect});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (disconnect ?? false) {
            animationController?.stop();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => InitialConfig()
              )
            );
          } else {
            pageController.jumpToPage(page);
          }
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: pageController?.page?.round() == page ? Theme.of(context).textSelectionColor : WidgetThemes.iconColor                
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: pageController?.page?.round() == page ? Theme.of(context).textSelectionColor : WidgetThemes.textNormalColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}