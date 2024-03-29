import 'package:AppToken2FA/screens/initial_config_screen.dart';
import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPopupMenuButton extends StatelessWidget {

  static const int _menuItemServerStatus = 1;
  static const int _menuItemReauthorize = 2;
  // static const int _menuItemRemoveAuthorization = 3;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      onSelected: (value) async => _selectOption(context, value),
      itemBuilder: (context) => _buildMenuItens(),
      icon: Icon(Icons.settings, color: WidgetThemes.iconColor),
      // offset: Offset(0, -170),
      offset: Offset(0, -120),
    );
  }

  List<PopupMenuEntry<int>> _buildMenuItens() {    
    return [
      PopupMenuItem(
        value: _menuItemServerStatus,
        child: Row(
          children: [
            FaIcon(FontAwesomeIcons.server, color: WidgetThemes.iconColor),
            SizedBox(width: 10),
            Text("Status servidor", style: TextStyle(color: Colors.black12))
          ],
        )
        
      ),
      PopupMenuItem(
        value: _menuItemReauthorize,
        child: Row(
          children: [
            Icon(Icons.verified_user, color: WidgetThemes.iconColor),
            SizedBox(width: 10),
            Text("Reautorizar dispositivo")
          ],
        )
      ),
      // PopupMenuItem(
      //   value: _menuItemRemoveAuthorization,
      //   child: Row(
      //     children: [
      //       Icon(Icons.remove_circle, color: WidgetThemes.iconColor),
      //       SizedBox(width: 10),
      //       Text("Remover dispositivo", style: TextStyle(color: Colors.black12))
      //     ],
      //   )
      // )
    ];
  }

  void _selectOption(BuildContext context, int value) {
    switch (value) {
      case _menuItemReauthorize:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => InitialConfig()
          )
        );
        break;
      default:
    }
  }

}