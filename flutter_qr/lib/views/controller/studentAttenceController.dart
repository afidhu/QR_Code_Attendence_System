import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/studentAttendenceModel.dart';
import '../ApiProvider/AllApi.dart';
import 'authcontroller.dart';

class StudentAttendenceController extends GetxController{
  AuthController authController =Get.put(AuthController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStudentAttendance();
  }


  var studentAttendenceData =<StudentAttendences>[].obs;

  Future<List<StudentAttendences>> getStudentAttendance() async{
    try{
      final url =Uri.parse("${ApiUrls.studentattendences}?student_reg=${authController.student_reg.value}");
      var response = await http.get(url);
      // print("studentdata :${response.body}");

      if(response.statusCode ==200 && response.body.isNotEmpty){
        print("studentdata -:${response.body}");
        List<dynamic> jsonList = jsonDecode(response.body);
        List<StudentAttendences> dataList =
            jsonList.map((json) => StudentAttendences.fromJson(json)).toList();
        print("dataList --:${dataList.hashCode}");
        studentAttendenceData.assignAll(dataList);

        return studentAttendenceData;
      }
      else{
        print("studentdata:[] ");
        return studentAttendenceData;
      }

    } catch(e){
      throw Exception('error at : $e');
    }finally{}
  }
}