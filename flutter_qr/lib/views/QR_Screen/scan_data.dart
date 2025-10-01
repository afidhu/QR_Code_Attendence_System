import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../controller/attendanceController.dart';

class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrcodeResult = "Scan data will appear below";

  AttendancesController attendancesController = Get.put(
    AttendancesController(),
  );

  Future<void> scanQr() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRScannerPage()),
    );

    if (result != null) {
      setState(() {
        qrcodeResult = result.toString();

        debugPrint('The mydata captured is is :: ${result.toString()}');
        print('mydata i s:::::: ${result.toString()}');
      });
      // attendancesController.assignAttendance(qrcodeResult);
    }
  }

  bool _isScanned = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("QR Code Scanner")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: attendancesController.controllerSign,
              decoration: InputDecoration(
                hintText: 'Please inter Signature',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            Text(qrcodeResult),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: scanQr,
              child: const Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  AttendancesController attendancesController = Get.put(
    AttendancesController(),
  );

  final MobileScannerController controller = MobileScannerController(
    cameraResolution: Size(1920, 1080),
    detectionSpeed: DetectionSpeed.noDuplicates,
    detectionTimeoutMs: 100,
    facing: CameraFacing.back,
    // returnImage:true ,
    torchEnabled: false,
    returnImage: false,
    invertImage: true,
    autoZoom: true,
  );

  // Timer? _timeoutTimer;
  final int timeoutMs = 10000; // 10 second timeout

  void closeCameraAfter10S() {
    Timer(Duration(milliseconds: timeoutMs), () {
      Navigator.pop(context, 'Timeout after 10 sec, Try Again');
    });
  }

  @override
  void initState() {
    super.initState();
    closeCameraAfter10S();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scanning...")),
      body: Column(
        children: [
          Expanded(
            child: MobileScanner(
              controller: controller,
              onDetect: (result) {
                final barcode = result.barcodes.first;
                final sessionId = barcode.rawValue;
                print(result.barcodes.first.rawValue);

                if (sessionId != null) {
                  print('Scanned session ID: $sessionId');
                  // You can now stop the scanner safely
                  controller.stop();
                  attendancesController.assignAttendance(sessionId);
                  Navigator.pop(context, sessionId);
                }
                // Data come back automatic
              },
            ),
          ),
        ],
      ),
    );
  }
}
