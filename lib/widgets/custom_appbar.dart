import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {

  final String titleText;

  CustomAppBar({@required this.titleText});

  @override
  Size get preferredSize => Size.fromHeight(70);

  //Adicionar tudo dentro do SafeArea - Vai garantir que não fique por baixo de nada

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
        child: SafeArea(
          child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          centerTitle: true,
          title: Text(              
            titleText,
            textAlign: TextAlign.center,              
          ),
        ),
        )
        
    );
  }
}