import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

class QRCode extends StatefulWidget {
  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  String result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("QRCODE Scanner"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Center(
          child: Text(result!=null?result:'Scan QR',style: TextStyle(fontSize: 16),),
        ),
        floatingActionButton:FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
          label: Text("Scan Now"),
          onPressed: scanQr,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  Future scanQr() async {
    try{
      String scanResult=await BarcodeScanner.scan();
      setState(() {
        result=scanResult;
      });
    }on PlatformException catch(e){
      if(e.code==BarcodeScanner.CameraAccessDenied){
        setState(() {
          result="camera permissiom is denied";
        });
      }else{
        setState(() {
          result="uknown error";
        });
      }
    }on FormatException catch(e){
      result="u pressed back button before scanning";
    }catch(e){
      setState(() {
        result="error";
      });
    }
  }
}
