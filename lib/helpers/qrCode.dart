import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrCode {

  final BuildContext context;

  QrCode({@required this.context});

  Future scan() async {
    try {

      //TODO: Polir função...

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

  //TODO: Colocar em lugar genérico que seja possível acessar por toda a aplicação
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

}