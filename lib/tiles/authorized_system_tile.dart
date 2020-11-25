import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';

class AuthorizedSystemTile extends StatelessWidget {

  final String systemName;
  final String login;
  final String lastLogin;

  AuthorizedSystemTile({@required this.systemName, 
                        @required this.login, 
                        @required this.lastLogin});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
          accentColor: WidgetThemes.expansionTileOpen
        ),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.all(15),
          title: Text(
            systemName,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: WidgetThemes.textNormalColor
            ),
          ),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Login associado",
                  style: TextStyle(
                    color: WidgetThemes.textNormalColor
                  )
                ),
                Text(
                  login,
                  style: TextStyle(
                    color: WidgetThemes.textNormalColor
                  )
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Último login",
                  style: TextStyle(
                    color: WidgetThemes.textNormalColor
                  )
                ),
                Text(
                  lastLogin,
                  style: TextStyle(
                    color: WidgetThemes.textNormalColor
                  )
                )
              ],
            )
          ],
        ),
      )
    );
  }
}