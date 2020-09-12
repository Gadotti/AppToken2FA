import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';
import 'package:AppToken2FA/widgets/circle_progress.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class TokenTab extends StatefulWidget {
  final PageController pageController;
  final AnimationController animationController;
  final int durationSecondsCicle;

  Function animationStatusListener; // ignore: must_be_immutable
  Function animationListener; // ignore: must_be_immutable
  
  TokenTab({
    this.animationController, 
    this.pageController, 
    this.durationSecondsCicle, 
    Key key}) 
    : super(key: key);
  
  @override
  _TokenTabState createState() => _TokenTabState();
}

class _TokenTabState extends State<TokenTab> with SingleTickerProviderStateMixin {
  
  Animation<double> _animation;
  bool _reversing;

  @override
  void initState() {
    super.initState();
        
    _reversing = false;

    //print('>>> iniciou animation');    
    
    _animation = Tween<double>(begin: 0, end: widget.durationSecondsCicle.toDouble()).animate(widget.animationController);
    _animation.removeStatusListener(widget.animationStatusListener);
    widget.animationStatusListener = (status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
                
        print('>>> reiniciou animation');
        _startCounting();
      }
    };

    
    //Listener para mostrar o contador no rodapé
    // _animation.removeListener(widget.animationListener);
    // widget.animationListener = () {
    //   //Trocar isso por um MobX
    //   setState(() {}); 
    // };
    // _animation.addListener(widget.animationListener);
    //------------------------------------------

    

    _startCounting();
    
    _animation.addStatusListener(widget.animationStatusListener);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold( 
      appBar: CustomAppBar(
        titleText: "Token de autorização",
      ),
      drawer: CustomDrawer(widget.pageController),      
      body: Stack(
        children: [
          // Center(
          //   child:  Column(              
          //     mainAxisAlignment: MainAxisAlignment.end,              
          //     children: [
          //       Padding(
          //         padding: EdgeInsets.only(bottom: 15),
          //         child: Text(
          //           '${_getCounterTimeLeft(_animation.value.toInt())}',
          //           style: TextStyle(
          //             color: Colors.grey
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Center(
            child: AnimatedBuilder(
              builder: _buildAnimation,
              animation: widget.animationController,
            ),
          ),
          Center(                            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'CÓDIGO SEGURANÇA',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: 10
                  ),
                ),
                Text(
                  '645021',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                    letterSpacing: 5
                  )
                )
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {     
      //     // debugPrint(animation.value.toString());
      //     _startCounting();
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.refresh),
      // )
      floatingActionButton: FloatingActionButton(
        onPressed: () {     
          //
        },
        child: FaIcon(FontAwesomeIcons.qrcode),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return CustomPaint(
      key: GlobalKey(),
      foregroundPainter: CirleProgress(_animation.value, _reversing, widget.durationSecondsCicle),      
      child: Container(
        width: 200,
        height: 200,
      ),
    );
  }

  void _startCounting() {
    if (_animation.value == widget.durationSecondsCicle) {
      _reversing = true;
      widget.animationController.reverse();
    } else if (_animation.value == 0) {
      _reversing = false;
      widget.animationController.forward();
    } else {
      _reversing = false;
      widget.animationController.reset();
      widget.animationController.forward();
    }
  }

  // String _getCounterTimeLeft(int value) {
  //   if (_reversing) {
  //     return value.toString();
  //   } else {
  //     return (widget.durationSecondsCicle - value).toString();
  //   }

  // }
}