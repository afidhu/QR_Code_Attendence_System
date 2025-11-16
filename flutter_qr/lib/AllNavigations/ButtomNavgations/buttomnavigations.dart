import 'package:flutter/material.dart';
import 'package:flutter_qr/views/home.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../views/QR_Screen/create_Qr.dart';
import '../../views/QR_Screen/scan_data.dart';
import '../../views/auth/profile.dart';
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
  AuthController authController = Get.put(AuthController());
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final pages =  [
      HomePage(),

      authController.student_role.value == 'CR'
          ? AttendancesList()
          : StudentHistory(),
      authController.student_role.value == 'CR'
          ? SessionsList()
          : ScanQrCode(),
    ];

    return Scaffold(
      // appBar: AppBar(
      //   title: Obx(() => Text('Welcome:${authController.student_name}')),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomLeft: Radius.circular(20),
      //       bottomRight: Radius.circular(20),
      //     ),
      //   ),
      //   centerTitle: true,
      //   actionsPadding: EdgeInsets.all(20),
      //   backgroundColor: Colors.orange,
      //   actions: [
      //     PopupMenuButton(
      //       child: Icon(Icons.account_circle_sharp),
      //       onSelected: (val) {
      //         if(val =='profile'){
      //           Get.to(()=>Profile());
      //         }
      //         else{
      //           authController.logout();
      //         }
      //       },
      //       itemBuilder: (context) => [
      //         PopupMenuItem(value: 'logout', child: Text('Logout')),
      //         PopupMenuItem(value: 'profile', child: Text('Profile')),
      //       ],
      //     ),
      //   ],
      // ),

    body:pages[currentIndex],

      bottomNavigationBar:  Obx(()=> BottomNavigationBar(
        // backgroundColor: Colors.white,
        // selectedItemColor: Colors.green,
        // unselectedItemColor: Colors.grey,
        // type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
         BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          authController.student_role.value == 'CR'
              ?  BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Attendances',
          )
              :  BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histories',
          ),
          authController.student_role.value == 'CR'
              ?  BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Sessions',
          )
              :  BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),

        ],
      )),
    );
  }
}
