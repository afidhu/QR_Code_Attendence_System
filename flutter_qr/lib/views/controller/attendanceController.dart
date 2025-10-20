import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/attendenceModel.dart';
import '../../model/attendenceperCourse.dart';
import '../ApiProvider/AllApi.dart';
import '../pages/printtableView.dart';
import 'authcontroller.dart';
import 'getDeviceInfo.dart';


class AttendancesController extends GetxController{
  GetDeviceInfo deviceInfo =Get.put(GetDeviceInfo());
  AuthController authController =Get.put(AuthController());

  TextEditingController controllerSign =TextEditingController();
  // session_id
  // device_id
  // student_reg
  // student_sign
  // device_name
  Future<bool> assignAttendance (session_id,) async{
    try{
      int sessionID = int.tryParse(session_id) ?? 0;
      int? classYears =int.tryParse(authController.student_year.value);
      int? program_Ids =int.tryParse(authController.student_program_id.value);
      print( 'controllergetSession id : $session_id');
      Attendances attendance =Attendances(
        sessionId: sessionID,
        studentReg:authController.student_reg.value,
        deviceId: deviceInfo.device_Unique_Id.value,
        deviceName: deviceInfo.device_manufature.value,
        studentSign:controllerSign.text ,
        classLevel: authController.student_level.value,
        classYear: classYears?.toInt(),
        programId: program_Ids!.toInt(),
      );
      final url  =Uri.parse(ApiUrls.assignAttendance);
      var response =await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(attendance.toJson()),
      );
      print("attendance ${attendance.classYear.runtimeType}");
      print("attendance ${attendance.classLevel.runtimeType}");
      print("attendance ${attendance.programId.runtimeType}");

      if(response.statusCode ==200 || response.statusCode==201){
        print('data are : ${response.body}');

        var jsondata =jsonDecode(response.body);
        print('error is ${response.body}');
        print('the message is ${jsondata['message']}');
        Get.snackbar(jsondata['status'].toString(),
          jsondata['message'].toString(),
          colorText: Colors.white,
          backgroundColor: Colors.black,
          animationDuration: Duration(milliseconds: 400),
          margin: EdgeInsets.fromLTRB(1, 1, 1, 5),
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.blue, Colors.green],
          ),
        );
        return true;
      }
      else{
        var jsondata =jsonDecode(response.body);
        print('error is ${response.body}');
        print('the message is ${jsondata['message']}');
        Get.snackbar(jsondata['error'].toString(),
            jsondata['message'].toString(),
          snackPosition: SnackPosition.BOTTOM ,
          colorText: Colors.white,
          backgroundColor: Colors.black,
          duration: Duration(seconds: 5),
          animationDuration: Duration(milliseconds: 400),
          margin: EdgeInsets.fromLTRB(1, 1, 1, 5),
          backgroundGradient: LinearGradient(
            colors: [Colors.red, Colors.blue, Colors.green],
          ),
        );
        return false;
      }
    } catch(e){
      throw Exception('error at : $e');
    } finally{}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getAttendencePerCourse('ds');
    getAttendence();
  }


  var attendanceData =<Attendances>[].obs;
  Future<void> getAttendence()async{
    try{
      print('object');
      final url = Uri.parse(ApiUrls.attendences);
      var response = await http.get(url);
      if(response.statusCode == 200 || response.statusCode ==201){
        print('data are :${response.body}');
        List<dynamic> jsonList =jsonDecode(response.body);
        List<Attendances> attendanceList =jsonList.map((json)=>Attendances.fromJson(json)).toList();
        attendanceData.assignAll(attendanceList);
      }

    } catch(e){
      print('error at : $e');
    } finally{}
  }




  var attendancePerCourse =<AttendancePerCourse>[].obs;
  Future<void> getAttendencePerCourse(String courseName)async{
   try{
     final url = Uri.parse('${ApiUrls.course_attendence}/$courseName');
     var response = await http.get(url);
     if(response.statusCode == 200 || response.statusCode ==201){
       print('data are :${response.body}');
       List<dynamic> jsonList =jsonDecode(response.body);
       List<AttendancePerCourse> attendancePerCourseList =jsonList.map((json)=>AttendancePerCourse.fromJson(json)).toList();
       attendancePerCourse.assignAll(attendancePerCourseList);
       if(attendancePerCourseList.isNotEmpty){
         Get.to(()=>PrintTableview(),fullscreenDialog: true,curve: Curves.bounceOut,duration: Duration(seconds: 2));
       }
       // await Get.to(()=>PrintTableview(),fullscreenDialog: true,curve: Curves.bounceOut,duration: Duration(seconds: 2) );
     }
   } catch(e){
     print('error at : $e');
   } finally{}
  }



}