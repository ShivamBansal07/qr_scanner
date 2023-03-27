import 'package:flutter/material.dart';

class QrCode extends StatelessWidget {
  final String text;
  const QrCode({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    var qrsize = MediaQuery.of(context).size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Generator'),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image(
          image: NetworkImage(
            'https://api.qrserver.com/v1/create-qr-code/?data=$text&size=${qrsize}x$qrsize',
          ),
        ),
      ),
    );
  }
}
