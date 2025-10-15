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
  AttendancesController attendancesController =Get.put(AttendancesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Obx(()=>Text(attendancesController.attendanceData.length.toString())),
      ),
      body: Scrollbar(
        trackVisibility: true,
        thumbVisibility: true,
        thickness: 20,
        radius: Radius.circular(20),
        interactive: true,
        scrollbarOrientation: ScrollbarOrientation.left,
        notificationPredicate: (_){
          print('now you are Scroll');
          return true;
        },
        child: Container(
          margin: EdgeInsets.all(10),
          color: Colors.cyan,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: attendancesController.attendanceData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1
              ),
              itemBuilder: (context,index){
              var data =attendancesController.attendanceData[index];
                return AttendanceCard(attendancesList: data,);
              }
          ),
        ),
      ),
    );
  }
}
