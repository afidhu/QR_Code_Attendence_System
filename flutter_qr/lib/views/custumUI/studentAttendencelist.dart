import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../model/studentAttendenceModel.dart';
import '../controller/studentAttenceController.dart';

class StudentAttendanceList extends StatefulWidget {

  const StudentAttendanceList({super.key,});

  @override
  State<StudentAttendanceList> createState() => _StudentAttendanceListState();
}

class _StudentAttendanceListState extends State<StudentAttendanceList> {
final StudentAttendenceController studentAttendenceController =Get.put(StudentAttendenceController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Expanded(
          child: ListView.builder(
              itemCount: studentAttendenceController.studentAttendenceData.length,
              itemBuilder: (context,index){
                return Card(
                  elevation: 10,
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text('data'),
                          Text('data')
                        ],
                      ),
                      Column(
                        children: [
                          Text('data'),
                          Text('data'),
                          Text('data')

                        ],
                      )
                    ],
                  ) ,
                );
              }
          )
      )
    );
  }
}
