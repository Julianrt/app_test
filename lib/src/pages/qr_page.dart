import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRPage extends StatefulWidget {
  @override
  _QRPageState createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  String _qr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _btnTakeQRCodeImage(),
            SizedBox(height: 25.0),
            _textQRCode(),
          ],
        ),
      ),
    );
  }

  Widget _btnTakeQRCodeImage() {
    return RaisedButton(
      child: Text('Leer codigo'),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D8BEF', 'Cancelar', false, ScanMode.QR);

        _qr = barcodeScanRes;
        setState(() {});
      },
    );
  }

  Widget _textQRCode() {
    return Text('Codigo QR: $_qr');
  }
}
