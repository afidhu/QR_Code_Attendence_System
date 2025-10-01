import 'package:flutter/material.dart';
import 'package:flutter_qr/views/custumUI/studentAttendencelist.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../QR_Screen/scan_data.dart';

class ButtonScan extends StatelessWidget {
  const ButtonScan({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Text('Student Attendance'),
          ),
         SizedBox(
           height: 300,
           child: StudentAttendanceList(),
         ),
          // ElevatedButton(
          //   style: ButtonStyle(
          //    backgroundColor: WidgetStatePropertyAll(Colors.deepPurpleAccent)
          //   ),
          //   onPressed: () {
          //     Get.to(() => ScanQrCode());
          //   },
          //   child: Text('Go to Scan', style: TextStyle(color:Colors.white),),
          // ),
        ],
      ),
    );
  }
}
