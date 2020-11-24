import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageController pageController;
  final int page;

  DrawerTile(this.icon, this.text, this.pageController, this.page);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
          // pageController.animateToPage(page, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 32.0,
                color: pageController.page.round() == page ? Theme.of(context).textSelectionColor : WidgetThemes.iconColor                
              ),
              SizedBox(
                width: 32.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: pageController.page.round() == page ? Theme.of(context).textSelectionColor : WidgetThemes.textNormalColor
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}