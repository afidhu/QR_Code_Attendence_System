import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

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
          child:Obx(()=> ListView.builder(
              itemCount: studentAttendenceController.studentAttendenceData.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                var data = studentAttendenceController.studentAttendenceData[index];
                return Card(
                  elevation: 10,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${index + 1}. ${data.courseName?.toUpperCase()} ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    data.courseName.toString().toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[700],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ),
                              ],
                            ),

                         SizedBox(height: Get.height*0.01),
                            Text(".INSTRUCTOR:${ data.staffName.toString().toUpperCase()}"
                              ,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                             SizedBox(height: Get.height*0.01),
                            Text(
                              DateFormat('dd MMM yyyy').format(DateTime.parse(data.date!)),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(height: Get.height*0.01,),

                            // Time row
                            Row(
                              children: [
                                Text(
                                  data.startTime.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.arrow_right, size: 20),
                                Text(
                                  data.endTime.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                              SizedBox(height: Get.height*0.01),
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Status:')
                                ),
                                 SizedBox(height: Get.height*0.01),
                                TextButton(
                                    onPressed: (){},
                                    child: Text('Attended', style: TextStyle(color: Colors.green),)
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                );
              }
          )
          )
      )
    );
  }
}
