import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/attendanceController.dart';
import '../custumUI/attendanceCard.dart';

class AttendancesList extends StatefulWidget {
  const AttendancesList({super.key});

  @override
  State<AttendancesList> createState() => _AttendancesListState();
}

class _AttendancesListState extends State<AttendancesList> {
  AttendancesController attendancesController = Get.put(AttendancesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Attendances Lists',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.teal,
        shadowColor: Colors.black45,
      ),

      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 10,
        radius: const Radius.circular(20),
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.left,
        notificationPredicate: (_) {
          print('now you are Scroll');
          return true;
        },

        child: Container(
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1,
                blurRadius: 12,
                offset: Offset(0, 3),
              )
            ],
          ),

          child: Obx(() => GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: attendancesController.attendanceData.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.80,
            ),

            itemBuilder: (context, index) {
              var data = attendancesController.attendanceData[index];
              return AttendanceCard(attendancesList: data);
            },
          )),
        ),
      ),
    );
  }
}
