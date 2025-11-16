import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qr/views/pages/cr_page.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../AllNavigations/ButtomNavgations/buttomnavigations.dart';
import '../AllNavigations/Drawers/alldrawer.dart';
import 'QR_Screen/create_Qr.dart';
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
  //  SessionsController sessionscontroller =Get.put(SessionsController());

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
      body: Obx(
        () => Container(
          child: authController.student_role.value.toString() == 'CR'
              ?CRPage()
              : ButtonScan(),
        ),

        // bottomNavigationBar:MyBottomNavigation()
      ),
    );
  }
}
