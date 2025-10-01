import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/studentAttendenceModel.dart';
import '../ApiProvider/AllApi.dart';

class StudentAttendenceController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStudentAttendance();
  }


  var studentAttendenceData =<StudentAttendences>[].obs;

  Future<List<StudentAttendences>> getStudentAttendance() async{
    try{
      final url =Uri.parse("${ApiUrls.studentattendences}?student_reg=${'30773/T.2023'}");
      var response = await http.get(url);

      if(response.statusCode ==200){
        var jsonList = jsonDecode(response.body);
        var jsonData = jsonList['data'] as List;
        var dataList = jsonData.map((json)=>StudentAttendences.fromJson(json)).toList();
        studentAttendenceData.assignAll(dataList);
        print("studentdata :${response.body}");
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