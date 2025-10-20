import 'package:flutter/material.dart';
import 'package:flutter_qr/views/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../views/QR_Screen/create_Qr.dart';
import '../../views/QR_Screen/scan_data.dart';
import '../../views/controller/authcontroller.dart';
import '../../views/pages/attendences.dart';
import '../../views/pages/sessions.dart';
import '../../views/pages/studenthistory.dart';

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
  AuthController authController = Get.put(AuthController());

  var currentIndex = 0;

  void Navigations() {
    switch (currentIndex) {
      case 0:
        print(currentIndex);
        Get.to(HomePage());
        break;

      case 1:
        authController.student_role.value == 'CR'? Get.to(() => AttendancesList()) : Get.to(() => StudentHistory());
        break;
      case 2:
        print(currentIndex);
        authController.student_role.value == 'CR'?  Get.to(()=>SessionsList()):  Get.to(ScanQrCode());

        // Get.to(CreateQr());
        break;
      default:
        print(currentIndex);
        Get.to(HomePage());
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      iconSize: 30,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      selectedIconTheme: IconThemeData(size: 30),
      unselectedIconTheme: IconThemeData(size: 30),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      currentIndex: currentIndex,
      onTap: (val) {
        setState(() {
          currentIndex = val;
          Navigations();
        });
      },
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        authController.student_role.value == 'CR' ?
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined),
              label: 'Attendances',
            ): BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Histories',
          ),

          authController.student_role.value == 'CR'?  BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sessions',
          ): BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),



        ],
    );
  }
}
