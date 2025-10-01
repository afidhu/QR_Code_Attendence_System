import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/timetableModel.dart';
import '../ApiProvider/AllApi.dart';
import '../home.dart';
import 'authcontroller.dart';

class TimetableController extends GetxController{
  /////////////////////get timetable according program id and year and student leve eg ism1

  var timetableCr =<TimetablePerCr>[].obs;

  Future<List<TimetablePerCr>> getTimetablePerCr(
      String student_program_id,
      String student_year,
      String student_level,
      String day,
      String date) async {
    try {
      final url = Uri.parse(
          '${ApiUrls.timetableByCr}/$student_program_id/$student_year/$student_level?day=$day&date=$date');
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonList = jsonDecode(response.body);
        var data = jsonList['data'] as List;
        var dataList = data.map((json) => TimetablePerCr.fromJson(json)).toList();
        timetableCr.assignAll(dataList);
        print('Timetable data: ${response.body}');
        Get.to(()=>HomePage());
//         return dataList;
        return dataList;
      } else {
        Get.snackbar(
            'Filtered ResultS 0 ', response.body,
          backgroundColor: Colors.black,colorText: Colors.white
        );
        throw Exception('Failed to get Data: ${response.body}');
      }
    } catch (e) {
      throw Exception('Internal error: $e');
    }
  }

}


//
//
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../../model/timetableModel.dart';
// import '../ApiProvider/AllApi.dart';
// import '../home.dart';
//
// class TimetableController extends GetxController {
//   var timetableCr = <TimetablePerCr>[].obs;
//
//   // Use plain Strings for day and date
//   Future<List<TimetablePerCr>> getTimetablePerCr(
//       String student_program_id,
//       String student_year,
//       String student_level,
//       String day,
//       String date) async {
//     try {
//       final url = Uri.parse(
//           '${ApiUrls.timetableByCr}/$student_program_id/$student_year/$student_level?day=$day&date=$date');
//       var response = await http.get(url);
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         var jsonList = jsonDecode(response.body);
//         var data = jsonList['data'] as List;
//         var dataList = data.map((json) => TimetablePerCr.fromJson(json)).toList();
//         timetableCr.assignAll(dataList);
//         print('Timetable data: ${response.body}');
//         return dataList;
//       } else {
//         throw Exception('Failed to get timetable: ${response.body}');
//       }
//     } catch (e) {
//       throw Exception('Internal error at $e');
//     }
//   }
// }
//
//
//
//
//
