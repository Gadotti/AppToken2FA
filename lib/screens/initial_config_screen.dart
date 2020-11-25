import 'package:AppToken2FA/dialogs/insert_config_key_dialog.dart';
import 'package:AppToken2FA/helpers/qrCode.dart';
import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InitialConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildScreen(context);
  }
}

Widget _buildScreen(BuildContext context) {
  final qrCodeHelper = QrCode(context: context);

  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Column(
      children: [
        SafeArea(
          child: Row(
            children: [
              _getIconReturnButton(context)
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Icon(Icons.account_circle, size: 80, color: WidgetThemes.iconColor),
              Text(
                "Configure sua conta", 
                style: TextStyle(
                  fontSize: 20,
                  color: WidgetThemes.textNormalColor
                )
              ),
              SizedBox(height: 30),
              Text(
                "Para configuarar sua conta, é necessário utilizar o código QR ou chave de definição a ser obtido no sistema autorizador. Se você estiver com dúvidas acesse https://duvidasautorizador.com.br",
                style: TextStyle(
                  color: WidgetThemes.textNormalColor
                ),
              ),
              SizedBox(height: 15),
              Divider(),
              InkWell(
                onTap: qrCodeHelper.scan,
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(                    
                    children: [
                      FaIcon(FontAwesomeIcons.qrcode, color: Theme.of(context).accentColor),
                      SizedBox(width: 15),
                      Text(
                        "Ler código QR",
                        style: TextStyle(
                          color: WidgetThemes.textNormalColor
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () => _insertConfigKeyTap(context),
                child: Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(                    
                    children: [
                      FaIcon(FontAwesomeIcons.keyboard, color: Theme.of(context).accentColor),
                      SizedBox(width: 15),
                      Text(
                        "Inserir chave de configuração",
                        style: TextStyle(
                          color: WidgetThemes.textNormalColor
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(),
            ],        
          ),
        ),
      ],
    )
  );
}

Widget _getIconReturnButton(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    return IconButton(
      icon: Icon(Icons.keyboard_arrow_left, color: WidgetThemes.iconColor),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  return Row();
}

void _insertConfigKeyTap (BuildContext context) async {
  String configKey = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: InsertConfigKeyDialog(),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
      );
    }
  );

  print('Config key: $configKey');
}