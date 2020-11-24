import 'dart:math';

import 'package:AppToken2FA/widgets/custom_appbar.dart';
import 'package:AppToken2FA/widgets/settings_popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:AppToken2FA/widgets/custom_drawer.dart';
import 'package:AppToken2FA/widgets/circle_progress.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
  bool _initingState;

  Future<String> _getTokenAndInitCounting() async {
    await Future.delayed(const Duration(seconds: 1));

    Random random = new Random();
    int randomNumber = random.nextInt(999999);

    _startCounting();
    return randomNumber.toString().padLeft(6, '0');
  }

  Future<String> _future;


  @override
  void initState() {
    super.initState();
        
    _initingState = true;
    _reversing = false;
    
    _animation = Tween<double>(begin: 0, end: widget.durationSecondsCicle.toDouble()).animate(widget.animationController);
    _animation.removeStatusListener(widget.animationStatusListener);
    widget.animationStatusListener = (status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        
        if (_initingState) {
          return;
        }
                
        // print('>>> reiniciou animation');
        setState(() {
          _future = _getTokenAndInitCounting();
        });
        
        // _startCounting();        
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

    // _startCounting();

    widget.animationController.reset();
    widget.animationController.stop();
    
    _animation.addStatusListener(widget.animationStatusListener);

    _initingState = false;

    _future = _getTokenAndInitCounting();
  }

  @override
  void dispose() {
    _animation.removeStatusListener(widget.animationStatusListener);
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
          Center(
            child: AnimatedBuilder(
              builder: _buildAnimation,
              animation: widget.animationController,
            ),
          ),
          FutureBuilder<String>(
            future: _future,
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.connectionState != ConnectionState.done) {              
                return _showWaitingGetNewTokenCode();
              } else if (snapshot.hasError) {
                widget.animationController.stop();
                return _showErrorOnGetNewTokenCode();
              } else {
                return _showNewTokenCode(snapshot.data);
              }
            }
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:_qrCodeScan,
        child: FaIcon(FontAwesomeIcons.qrcode),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SettingsPopupMenuButton()
          ],
        ),
      ),
    );
  }

  Future _qrCodeScan() async {
    try {

      // var options = ScanOptions(
      //   strings: {
      //     "cancel": _cancelController.text,
      //     "flash_on": _flashOnController.text,
      //     "flash_off": _flashOffController.text,
      //   },
      //   restrictFormat: selectedFormats,
      //   useCamera: _selectedCamera,
      //   autoEnableFlash: _autoEnableFlash,
      //   android: AndroidOptions(
      //     aspectTolerance: _aspectTolerance,
      //     useAutoFocus: _useAutoFocus,
      //   ),
      // );

      // var result = await BarcodeScanner.scan(options: options);
      // showDialog(context: context, )

      var barcode = await BarcodeScanner.scan();
      _showDialog('Resultado', barcode);
      // if (barcode.type == ResultType.Barcode) {
      //   _showDialog('Resultado', barcode);
      // } else if (barcode.type == ResultType.Error) {
      //   _showDialog('Erro', 'Não foi possível ler o QRCode com sucesso.');
      // }

      // setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        _showDialog('Erro de permissão', 'É necessário permitir o acesso à camera do dispositivo');
        // setState(() {
        //   this.barcode = 'The user did not grant the camera permission!';
        // });
      } else {
        _showDialog('Exceção', 'Erro desconhecido: $e');
        // setState(() => this.barcode = 'Unknown error: $e');
      }
    } on FormatException{
      // setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      _showDialog('Exceção', 'Erro desconhecido: $e');
      // setState(() => this.barcode = 'Unknown error: $e');
    }
  }

  void _showDialog(String title, String info) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(info),
          actions: <Widget>[
            FlatButton(
              child: Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

  Widget _showWaitingGetNewTokenCode() {
    return Center(                            
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black45),
                strokeWidth: 3.0,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'Buscando',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 10
                ),
              ),
            )
        ],
      ),
    );
  }

  Widget _showErrorOnGetNewTokenCode() {
    return Center(                            
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ERRO',
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontSize: 10
            ),
          ),
          Text(
            'Verifique sua conexão',
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontSize: 10
            ),
          )
        ],
      ),
    );
  }

  Widget _showNewTokenCode(String token) {
    return Center(                            
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
            token,
            style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontSize: 40,
              letterSpacing: 5
            )
          )
        ],
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

}