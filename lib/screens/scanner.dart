import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:scan/scan.dart';

class ScanQr extends StatelessWidget {
  ScanQr({super.key});
  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: ScanView(
          controller: controller,
          scanAreaScale: .5,
          scanLineColor: Colors.green.shade400,
          onCapture: (data) {
            // do something
          },
        ),
      ),
    );
  }
}
