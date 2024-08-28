import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrresult = 'Scanned Data will appear here';

  Future<void> scanQR() async {
    try {
      var result = await BarcodeScanner.scan();
      if (!mounted) return;

      setState(() {
        qrresult = result.rawContent.isNotEmpty ? result.rawContent : 'Failed to get QR Code';
      });
    } on PlatformException {
      setState(() {
        qrresult = 'Failed to read QR Code';
      });
    } on FormatException {
      setState(() {
        qrresult = 'User canceled the scan';
      });
    } catch (e) {
      setState(() {
        qrresult = 'Unexpected error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // Light amber background
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('QR Code Scanner'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.qr_code_scanner,
                size: 150,
                color: Colors.deepPurple,
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  qrresult,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: scanQR,
                child: Text('Scan Code'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  primary: Colors.deepPurple, // Background color
                  onPrimary: Colors.white, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
