import 'package:flutter/material.dart';
import 'package:AppToken2FA/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;
  final AnimationController animationController;

  CustomDrawer({@required this.pageController, this.animationController});

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            //Color.fromARGB(255, 203, 236, 241),
            //Colors.lightBlue[50],
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight
        )
      ),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 90.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        "EmpresaX 2FA",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Olá, Eduardo Gadotti!", //"Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          // GestureDetector(
                          //   child: Text(
                          //     "Desconectar", // !model.isLoggedIn() ? "Entre ou cadastre-se >" : "Sair",
                          //     style: TextStyle(
                          //       color: Theme.of(context).primaryColor,
                          //       fontSize: 16.0,
                          //       fontWeight: FontWeight.bold
                          //     ),
                          //   ),
                          //   onTap: () {
                          //     // if (!model.isLoggedIn()) {
                          //     //   Navigator.of(context).push(
                          //     //     MaterialPageRoute(builder: (context) => LoginScreen())
                          //     //   );
                          //     // }
                          //     // else {
                          //     //   model.signOut();
                          //     // }                              
                          //   },
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(icon: Icons.security, text: 'Token de autorização', pageController: pageController, page: 0),
              DrawerTile(icon: Icons.list, text: 'Sistemas autorizados', pageController: pageController, page: 1),
              DrawerTile(icon: Icons.settings, text: 'Configurações', pageController: pageController, page: 2),
              DrawerTile(icon: Icons.help, text: 'Ajuda', pageController: pageController, page: 3),
              Divider(),
              DrawerTile(icon: Icons.exit_to_app, text: 'Desconectar', animationController: animationController, disconnect: true,),
            ],
          )
        ],
      ),
    );
  }
}