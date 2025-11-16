import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../auth/profile.dart';
import '../controller/authcontroller.dart';
import '../controller/timetablecontroller.dart';
import '../custumUI/materialButton.dart';
import '../QR_Screen/create_Qr.dart';

class CRPage extends StatefulWidget {
  const CRPage({super.key});

  @override
  State<CRPage> createState() => _CRPageState();
}

class _CRPageState extends State<CRPage> {
  AuthController authController = Get.find<AuthController>();
  TimetableController timetableController = Get.put(TimetableController());

  RxString selectedDay = 'monday'.obs;
  RxString pickedDate = ''.obs;

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      pickedDate.value = picked.toIso8601String().split("T")[0];
    }
  }

  @override
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
              else{
                authController.logout();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'logout', child: Text('Logout')),
              PopupMenuItem(value: 'profile', child: Text('Profile')),
            ],
          ),
        ],
      ),

      body: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
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
                DropdownButton(
                  value: selectedDay.value,
                  items: const [
                    DropdownMenuItem(value: "monday", child: Text("Monday")),
                    DropdownMenuItem(value: "tueday", child: Text("Tuesday")),
                    DropdownMenuItem(value: "wensday", child: Text("Wednesday")),
                    DropdownMenuItem(value: "thirsday", child: Text("Thursday")),
                    DropdownMenuItem(value: "friday", child: Text("Friday")),
                  ],
                  onChanged: (value) {
                    selectedDay.value = value!;
                  },
                ),

                Obx(() => Text(
                  pickedDate.value.isEmpty ? "Pick date" : pickedDate.value,
                )),

                GestureDetector(
                  onTap: () => pickDate(context),
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
                )
              ],
            ),
          ),

          Expanded(
            child: Obx(() => ListView.builder(
              itemCount: timetableController.timetableCr.length,
              itemBuilder: (context, index) {
                var data = timetableController.timetableCr[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${index + 1}. ${data.courseCode}",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          data.courseName ?? "",
                          style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                        ),

                        SizedBox(height: 10),

                        Text("INSTRUCTOR: ${data.staffName}"),

                        SizedBox(height: 10),

                        Text(DateFormat('dd MMM yyyy')
                            .format(DateTime.parse(data.date!))
                        ),

                        SizedBox(height: 10),

                        Row(
                          children: [
                            Text(data.startTime ?? ""),
                            Icon(Icons.arrow_right),
                            Text(data.endTime ?? ""),
                          ],
                        ),

                        SizedBox(height: 15),

                        data.isSessioned == true
                            ? MyMaterialButton(
                          tametable_id: data.timetableId!.toInt(),
                        )
                            : Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text("Absent"),
                              ),
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(() => CreateQr(),
                                      arguments: data.timetableId);
                                },
                                icon: Icon(Icons.qr_code),
                                label: Text("Present"),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
          ),
        ],
      ),
    );
  }
}
