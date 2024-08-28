import 'dart:math'; // For generating random colors
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SavedQRCodesPage extends StatelessWidget {
  final List<String> savedQRCodes;

  const SavedQRCodesPage({super.key, required this.savedQRCodes});

  // Function to generate a random color
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Saved QR Codes'),
      ),
      backgroundColor: Colors.amber[50], // Light background for the entire page
      body: savedQRCodes.isEmpty
          ? Center(
        child: Text(
          'No QR Codes saved yet.',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: savedQRCodes.length,
        itemBuilder: (context, index) {
          // Get a random color for each QR code card
          final cardColor = getRandomColor();

          return Card(
            color: cardColor,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            elevation: 5, // Add elevation for shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImageView(
                    data: savedQRCodes[index],
                    size: 200,
                  ),
                  SizedBox(height: 10),
                  Text(
                    savedQRCodes[index],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color for better contrast
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
