import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';

class AuthorizedSystemTile extends StatelessWidget {

  final String systemName;

  AuthorizedSystemTile({@required this.systemName});

  @override
  Widget build(BuildContext context) {
    return Card(      
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Theme(
        data: ThemeData(
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
                  "eduardo.gadotti",
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
                  "24/11/2020 13:43:33",
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