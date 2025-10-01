import 'package:flutter/material.dart';
import 'package:flutter_qr/views/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../views/QR_Screen/create_Qr.dart';
import '../../views/QR_Screen/scan_data.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {

  // final List<Widget> allBottomNav = [
  //   HomePage(),
  //   ScanQrCode(),
  // ];

  var currentIndex = 0;

  void Navigations() {
    switch (currentIndex) {
      case 0:
        Get.to(HomePage());
        break;
      case 1:
        Get.to(ScanQrCode());
        // Get.to(CreateQr());
        break;
      default:
        Get.to(HomePage());
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (val) {
        setState(() {
          currentIndex = val;
          Navigations();
        });
      },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
        ],
    );
  }
}
