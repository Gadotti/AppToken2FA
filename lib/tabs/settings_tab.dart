import 'package:AppToken2FA/controllers/labeled_switch_controller.dart';
import 'package:AppToken2FA/theme/widget_themes.dart';
import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';

class SettingsTab extends StatefulWidget {

  final PageController pageController;

  SettingsTab({Key key, this.pageController}) : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {

  var _controllerConfig1 = LabeledSwitchController(value: true);
  var _controllerConfig2 = LabeledSwitchController(value: true);
  var _controllerConfig3 = LabeledSwitchController(value: false);

  var _controllerConfig4 = LabeledSwitchController(value: true);
  var _controllerConfig5 = LabeledSwitchController(value: true);
  var _controllerConfig6 = LabeledSwitchController(value: false);

  var _controllerConfig7 = LabeledSwitchController(value: true);
  var _controllerConfig8 = LabeledSwitchController(value: true);
  var _controllerConfig9 = LabeledSwitchController(value: false);

  var _controllerConfig10 = LabeledSwitchController(value: true);
  var _controllerConfig11 = LabeledSwitchController(value: true);
  var _controllerConfig12 = LabeledSwitchController(value: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: CustomAppBar(
        titleText: "Configurações",
      ),
      drawer: CustomDrawer(pageController: widget.pageController),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {    

    return ListView(
      padding: EdgeInsets.all(15),
      children: [        
        _buildNewCategory('Notificações'),
        _getSingleLabeledSwitch('Configuração teste 1', _controllerConfig1),
        _getSingleLabeledSwitch('Configuração teste 2', _controllerConfig2),
        _getSingleLabeledSwitch('Configuração teste 3', _controllerConfig3),

        _buildNewCategory('Segurança'),
        _getSingleLabeledSwitch('Configuração teste 4', _controllerConfig4, enabled: false),
        _getSingleLabeledSwitch('Configuração teste 5', _controllerConfig5),
        _getSingleLabeledSwitch('Configuração teste 6', _controllerConfig6, enabled: false),
        _getSingleLabeledSwitch('Configuração teste 7', _controllerConfig7),
        _getSingleLabeledSwitch('Configuração teste 8', _controllerConfig8),
        _getSingleLabeledSwitch('Configuração teste 9', _controllerConfig9),

        _buildNewCategory('Diversos'),
        _getSingleLabeledSwitch('Configuração teste 10', _controllerConfig10),
        _getSingleLabeledSwitch('Configuração teste 11', _controllerConfig11),
        _getSingleLabeledSwitch('Configuração teste 12', _controllerConfig12),
      ],
    );
  }

  Widget _buildNewCategory(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          name,
          style: TextStyle(
            color: WidgetThemes.textNormalColor,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        Divider()
      ],
    );
  }  

  Widget _getSingleLabeledSwitch(String configLabel, LabeledSwitchController switchController, {bool enabled = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            configLabel,
            style: TextStyle(
              color: WidgetThemes.textNormalColor
            ),
          ),
        ),
        Switch(          
          value: switchController.value ?? false,
          onChanged: !enabled ? null : 
            (bool newValue) {
              setState(() {
                switchController.changeValue(newValue);
              });
            },
        )
      ],
    );
  }
}