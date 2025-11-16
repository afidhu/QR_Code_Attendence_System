import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/attendenceModel.dart';
import '../controller/attendanceController.dart';

class AttendanceCard extends StatelessWidget {
  final Attendances attendancesList;
  const AttendanceCard({super.key, required this.attendancesList});

  @override
  Widget build(BuildContext context) {
    AttendancesController attendancesController = Get.put(AttendancesController());

    return Padding(
      padding: const EdgeInsets.all(4.0),

      child: Card(
        elevation: 6,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,

        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// Instructor + Course
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Instructor: ${attendancesList.staffName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      attendancesList.courseName.toString().toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: Get.height * 0.012),

              /// Date
              Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.grey.shade600, size: 18),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      DateFormat('dd MMM yyyy')
                          .format(DateTime.parse(attendancesList.createdAt!)),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: Get.height * 0.012),

              /// Time range — FIXED: prevent overflow
              Row(
                children: [
                  Icon(Icons.access_time, color: Colors.grey.shade600, size: 18),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      attendancesList.startTime.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.arrow_right_alt),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      attendancesList.endTime.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: Get.height * 0.02),

              /// Button
              Center(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.teal.shade600,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    elevation: 3,
                  ),

                  onPressed: () {
                    attendancesController.getAttendencePerCourse(
                      attendancesList.courseName.toString(),
                    );
                  },
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.print, size: 20),
                      SizedBox(width: 6),
                      Text(
                        "View",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
