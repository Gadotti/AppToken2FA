import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:flutter/material.dart';

class InsertConfigKeyDialog extends StatelessWidget {

  final _textConfigKeyControler = TextEditingController();

  InsertConfigKeyDialog();
  
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(      
        mainAxisSize: MainAxisSize.min,        
        children: <Widget>[
          Center(
            child: Text(
              'Inisira sua chave',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: WidgetThemes.textNormalColor),
            )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 24, 10, 24),
            child: TextField(
              enableSuggestions: false,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 20,
                color: WidgetThemes.textNormalColor,
                letterSpacing: 2.0,
              ),
              textAlign: TextAlign.center,              
              controller: _textConfigKeyControler,
            ),
          ),
          Row(            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(null),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: WidgetThemes.textNormalColor),
                ),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(_textConfigKeyControler.text),
                textColor: Colors.white,
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('OK'),
              )
            ],
          )
        ],
      ),
    );
  }

}