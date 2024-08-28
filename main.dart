import 'package:flutter/material.dart';
import 'package:new_project/generate_qrCode.dart';
import 'package:new_project/scan_QRcode.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR code Scanner and Generator',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(title: Text('QR Code Scanner and Generator'),backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('assets/sarwar.png',width: 300,height: 300,),
            SizedBox(height: 10,),
            Text('This is a QR code scanner my simple app',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScanQRCode()),);
              });
            },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, // Set the background color here
                  foregroundColor: Colors.white, // Set the text color
                ),
                child: Text('Scan QR code')),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenerateQRCode()));
              });
            }, child: Text('Generate QR code'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Set the background color here
                foregroundColor: Colors.white, // Set the text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

