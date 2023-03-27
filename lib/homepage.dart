import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:qr_scanner/qrcode.dart';
import 'package:qr_scanner/scanner.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scan&Generate'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: TextField(
              cursorColor: Colors.amber,
              onChanged: (val) {
                value = val;
              },
              autofocus: false,
              autocorrect: false,
              decoration: const InputDecoration(
                fillColor: Colors.amber,
                focusColor: Colors.amber,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                ),
                hintText: 'Enter Text/Link',
                helperText: 'Example: https://www.google.com/',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.amber,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              if (value != "") {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QrCode(
                      text: value,
                    ),
                  ),
                );
              } else {
                showPlatformDialog(
                  context: context,
                  builder: (_) => PlatformAlertDialog(
                    title: const Text('Error'),
                    content: const Text('Enter some text to generate QR Code'),
                    actions: <Widget>[
                      PlatformDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              }
            },
            child:
                const Text('Generate', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.amber,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              showPlatformDialog(
                context: context,
                builder: (_) => PlatformAlertDialog(
                  title: const Text('OR Scan'),
                  content: const Text('This Feature will soon be available'),
                  actions: <Widget>[
                    PlatformDialogAction(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Ok'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Scan', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
