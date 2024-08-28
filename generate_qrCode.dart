import 'package:flutter/material.dart';
import 'package:new_project/save_qrcode.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'qr_code_display_page.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  TextEditingController urlController = TextEditingController();
  List<String> qrCodes = []; // List to store QR codes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50], // Light amber background
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Generate QR Code'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              // Navigate to the list of saved QR codes
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedQRCodesPage(savedQRCodes: qrCodes),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code_2,
                  size: 150,
                  color: Colors.deepPurple,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      hintText: 'Enter your data',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Enter your data',
                      labelStyle: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (urlController.text.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QRCodeDisplayPage(
                            data: urlController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Generate QR Code'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    primary: Colors.deepPurple, // Background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (urlController.text.isNotEmpty) {
                      setState(() {
                        qrCodes.add(urlController.text); // Save QR code data to the list
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('QR Code saved!')),
                      );
                    }
                  },
                  child: Text('Save QR Code'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    primary: Colors.green, // Background color
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
      ),
    );
  }
}
