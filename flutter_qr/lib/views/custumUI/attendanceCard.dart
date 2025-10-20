import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../model/attendenceModel.dart';
import '../controller/attendanceController.dart';

class AttendanceCard extends StatelessWidget {
  final Attendances attendancesList;
  const AttendanceCard({super.key, required this.attendancesList});

  @override
  Widget build(BuildContext context) {
    AttendancesController attendancesController =Get.put(AttendancesController());
    final dentistAppointment = DateTime(2017, 9, 7, 17, 30);
    final mark = DateTime.timestamp();
    return  Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        color: Colors.grey,
        child:  Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Instructor:${attendancesList.staffName}'),
                Text(attendancesList.courseName.toString().toUpperCase()),
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            Text(
              DateFormat(
                'dd MMM yyyy',
              ).format(DateTime.parse(attendancesList.createdAt!)),
            ),
            SizedBox(height: Get.height * 0.01),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(attendancesList.startTime.toString()),
                Icon(Icons.arrow_right),
                Text(attendancesList.endTime.toString()),
              ],
            ),
            SizedBox(height: Get.height * 0.01),
            FilledButton(onPressed:(){attendancesController.getAttendencePerCourse(attendancesList.courseName.toString());} , child: Icon(Icons.print)),
          ],
        ),
      ),
    );
  }
}
