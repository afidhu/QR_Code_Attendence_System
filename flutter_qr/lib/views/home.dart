import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../AllNavigations/ButtomNavgations/buttomnavigations.dart';
import '../AllNavigations/Drawers/alldrawer.dart';
import 'QR_Screen/create_Qr.dart';
import 'QR_Screen/scan_data.dart';
import 'auth/profile.dart';
import 'controller/authcontroller.dart';
import 'controller/sessionscontroller.dart';
import 'controller/timetablecontroller.dart';
import 'custumUI/go_to_scannUi.dart';
import 'custumUI/materialButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = Get.put(AuthController());
  TimetableController timetableController = Get.put(TimetableController());
  SessionsController sessionscontroller =Get.put(SessionsController());

  RxString selectedDay = 'monday'.obs;
  RxString pickedDate = ''.obs;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Sets the initial date displayed
      firstDate: DateTime(2000), // Sets the earliest selectable date
      lastDate: DateTime(2100), // Sets the latest selectable date
    );
    if (picked != null) {
      print('Selected date: $picked');
      print('Selected date: ${picked.toIso8601String().split('T')[0]}');
      // authController.date =pickedDate;
      // timetableController.day.value = picked.weekday.toString();
      // timetableController.date.value = picked.toIso8601String().split('T')[0].toString();
      //

      pickedDate.value = picked.toIso8601String().split('T')[0];
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    // if(pickedDate.value ==null){
    //   setState(() {
    //     pickedDate.value ='2025-01-01';
    //   });
    // }
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Welcome:${authController.student_name}')),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        centerTitle: true,
        actionsPadding: EdgeInsets.all(20),
        backgroundColor: Colors.orange,
        actions: [
          PopupMenuButton(
            child: Icon(Icons.account_circle_sharp),
            onSelected: (val) {
              if(val =='profile'){
               Get.to(()=>Profile());
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'logout', child: Text('Logout')),
              PopupMenuItem(value: 'profile', child: Text('Profile')),
            ],
          ),
        ],
      ),

      body: Container(
        child: authController.student_role.value.toString() == 'CR'
            ? Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Text('data'),
                          DropdownButton(
                            value: selectedDay.value,
                            items: [
                              DropdownMenuItem(
                                value: "monday",
                                child: Text('Monday'),
                              ),
                              DropdownMenuItem(
                                value: "tueday",
                                child: Text('Tuesday'),
                              ),
                              DropdownMenuItem(
                                value: "wensday",
                                child: Text('Wensday'),
                              ),
                              DropdownMenuItem(
                                value: "thirsday",
                                child: Text('Thirsday'),
                              ),
                              DropdownMenuItem(
                                value: "friday",
                                child: Text('Friday'),
                              ),
                            ],
                            onChanged: (val) async {
                              selectedDay.value = val!;
                              setState(() {});
                            },
                          ),
                          if (pickedDate.value.toString().isNotEmpty)
                            Obx(() => Text(pickedDate.value)),
                          GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Icon(Icons.calendar_month),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              timetableController.getTimetablePerCr(
                                authController.student_program_id.value,
                                authController.student_year.value,
                                authController.student_level.value,
                                selectedDay.value,
                                pickedDate.value,
                              );
                            },
                            child: Text("Filter"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.7,
                        child: RefreshIndicator(
                          backgroundColor: Colors.purple,
                          color: Colors.white,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: timetableController.timetableCr.length,
                            itemBuilder: (context, index) {
                              var data = timetableController.timetableCr[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),

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
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${index + 1}. ${data.courseCode?.toUpperCase()} ',
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

                                        const SizedBox(height: 10),
                                        Text(".INSTRUCTOR:${data.timetableId} ${ data.staffName.toString().toUpperCase()}"
                                         ,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.deepPurpleAccent,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          DateFormat('dd MMM yyyy').format(DateTime.parse(data.date!)),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

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

                                        const SizedBox(height: 15),

                                       data.isSessioned ==true ? MyMaterialButton(tametable_id: data.timetableId!.toInt(),) :
                                       Row(
                                         children: [
                                           Expanded(
                                             child: ElevatedButton(
                                               onPressed: () {},
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: Colors.red,
                                                 padding: EdgeInsets.symmetric(
                                                   vertical: 12,
                                                 ),
                                               ),
                                               child: Text(
                                                 "Absent",
                                                 style: TextStyle(
                                                   fontSize: 14,
                                                 ),
                                               ),
                                             ),
                                           ),
                                           const SizedBox(width: 10),
                                           Expanded(
                                             child: ElevatedButton.icon(
                                               onPressed: () {
                                                 Get.to(
                                                       () => CreateQr(),
                                                   arguments: data.timetableId,
                                                 );
                                               },
                                               icon: Icon(
                                                 Icons.qr_code,
                                                 size: 18,
                                               ),
                                               label: Text("Present"),
                                               style: ElevatedButton.styleFrom(
                                                 backgroundColor: Colors.blue,
                                                 padding: EdgeInsets.symmetric(
                                                   vertical: 12,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),


                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          onRefresh: () async {
                            setState(() {});
                            return;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : ButtonScan(),
      ),
      drawer: MyDrawerNavigation(),
      bottomNavigationBar:MyBottomNavigation()
    );
  }
}
