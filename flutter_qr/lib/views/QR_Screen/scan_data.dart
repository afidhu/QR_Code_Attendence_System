import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/attendanceController.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../controller/attendanceController.dart';


class ScanQrCode extends StatefulWidget {
  const ScanQrCode({super.key});

  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String qrcodeResult = "Scan data will appear here";

  AttendancesController attendancesController =
  Get.put(AttendancesController());

  Future<void> scanQr() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QRScannerPage()),
    );

    if (result != null) {
      setState(() {
        qrcodeResult = result.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code Scanner"),
        centerTitle: true,
        elevation: 1,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// Signature Input
            TextField(
              controller: attendancesController.controllerSign,
              decoration: InputDecoration(
                labelText: "Enter Your Signature",
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: const Icon(Icons.edit),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            const SizedBox(height: 20),

            /// Scan Result Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.qr_code_2, size: 40, color: Colors.green),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        qrcodeResult,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Scan Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: Colors.green,
                ),
                onPressed: scanQr,
                icon: const Icon(Icons.qr_code_scanner),
                label: const Text(
                  "Start Scanning",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),
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
  AttendancesController attendancesController = Get.put(AttendancesController());

  final MobileScannerController controller = MobileScannerController(
    cameraResolution: Size(1920, 1080),
    detectionSpeed: DetectionSpeed.noDuplicates,
    detectionTimeoutMs: 100,
    facing: CameraFacing.back,
    torchEnabled: false,
    returnImage: false,
    invertImage: false,
    autoZoom: true,
  );

  final int timeoutMs = 10000;

  @override
  void initState() {
    super.initState();

    /// Timeout auto-close
    Timer(Duration(milliseconds: timeoutMs), () {
      if (mounted) Navigator.pop(context, "Scanning timeout. Try again.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Scanning..."),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
      ),

      body: Stack(
        alignment: Alignment.center,
        children: [
          /// CAMERA
          MobileScanner(
            controller: controller,
            onDetect: (result) {
              final barcode = result.barcodes.first;
              final value = barcode.rawValue;

              if (value != null) {
                controller.stop();
                attendancesController.assignAttendance(value);
                Navigator.pop(context, value);
              }
            },
          ),

          /// Overlay Scanner Box
          Container(
            width: 280,
            height: 280,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          /// Instruction Text
          Positioned(
            bottom: 40,
            child: Text(
              "Align QR inside the frame",
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
