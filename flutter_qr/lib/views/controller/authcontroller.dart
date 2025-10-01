import 'dart:convert';
import 'package:flutter_qr/views/controller/timetablecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/studentModelAuth.dart';
import '../ApiProvider/AllApi.dart';
import '../home.dart';

class AuthController extends GetxController{

  TextEditingController controllerStudentReg =TextEditingController();
  TextEditingController controllerStudentPsw =TextEditingController();


  Future myBottomSheent() async{
    Get.bottomSheet(
        Container(
          margin: EdgeInsets.fromLTRB(1, 0, 1, 1),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child:Obx(()=>  TextField(
                    controller: controllerStudentReg,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: 'Eg, S30772/T.2020  $student_reg'
                    ),
                  ),
                ),
              )),
              SizedBox(
                height: 100,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: controllerStudentPsw,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        hintText: 'Enter Password'
                    ),
                  ),
                ),

              ),
              SizedBox(
                child: MaterialButton(
                  color: Colors.deepOrange,
                  onPressed: studentLogin,
                  child: Icon(Icons.login),
                ),
              )
            ],
          ),
        )
    );
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // loadData();
  }


  StudentsAuth studentdata =StudentsAuth();

  var is_loading =false.obs;
  //
  String? day;
  String? date;

  var student_name =''.obs;
  var student_reg =''.obs;
  var student_role =''.obs;
  var student_course_id =''.obs;
var student_program_id =''.obs;
  var student_year =''.obs;
  var student_level =''.obs;

  var errorMessage =''.obs;

  Future<StudentsAuth> studentLogin()async{
    is_loading.value =true;

    try{
      StudentsAuth student =StudentsAuth(
        studentPassword: controllerStudentPsw.text,
        studentReg: controllerStudentReg.text,
        // studentPassword: 'asha123',
        // studentReg: '30773/T.2023',
      );
      final url =Uri.parse(ApiUrls.auth);
      var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(student.toJson()),
      );

      if(response.statusCode ==200){
        is_loading.value =false;
        var jsondata = await jsonDecode(response.body);
        studentdata =StudentsAuth.fromJson(jsondata);

        // Obtain shared preferences.
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('student_name', studentdata.studentName.toString());
        await prefs.setString('student_reg', studentdata.studentReg.toString());
        await prefs.setString('student_course_id',studentdata.courseId.toString() );
        await prefs.setString('student_program_id',studentdata.programId.toString());
        await prefs.setString('student_year', studentdata.year.toString());
        await prefs.setString('student_level', studentdata.studentLevel.toString());
        await prefs.setString('student_role', studentdata.studentRole.toString());

        loadData();
        print(response.body);
        return studentdata;
      }
      else{
        is_loading.value =false;
        var jsondata = jsonDecode(response.body);
          errorMessage.value =jsondata['error'];
          Get.back();

          Get.snackbar('Fail', errorMessage.toString(),
             snackPosition: SnackPosition.BOTTOM ,
              colorText: Colors.white,
            backgroundColor: Colors.black,
            animationDuration: Duration(milliseconds: 400),
            margin: EdgeInsets.fromLTRB(1, 1, 1, 5),
            backgroundGradient: LinearGradient(
              colors: [Colors.red, Colors.blue, Colors.green],
            ),

          );

        throw Exception ('Something went wrong, $errorMessage');
      }

    } catch(e){
      throw Exception( 'error at :$e');
    } finally{
      is_loading.value =false;
    }

  }


  TimetableController timetableController =Get.put(TimetableController());

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? student_names = prefs.getString('student_name');
    final String? regno= prefs.getString('student_reg');
    final String? courseId =prefs.getString('student_course_id' );
    final String? program_id = prefs.getString('student_program_id');
    final String? year = prefs.getString('student_year');
    final String? level =prefs.getString('student_level');
    final String? student_roles =prefs.getString('student_role');
    student_name.value =student_names!;
    student_role.value =student_roles!;

    if (regno!=null || courseId!=null || program_id !=null || year!=null || level!= null ) {
       student_reg.value =regno!;
       student_course_id.value =courseId!;
      student_program_id.value =program_id!;
       student_year.value =year!;
     student_level.value =level!;
       if(student_reg.value.isNotEmpty){
         print('reg data ${student_reg.value}');

         if(student_role.value !='CR'){
           await  Get.to(()=>HomePage());
         }else {
           timetableController.getTimetablePerCr(
               student_program_id.value, student_year.value,
               student_level.value, '', '');
         }
       }
       // timetableController.getTimetablePerCr(student_program_id,student_year,student_level);
     // await  Get.to(()=>HomePage());

     print('object $student_reg');

    }
  }



}




// import 'dart:convert';
// import 'package:flutter_qr/views/controller/timetablecontroller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../../model/studentModelAuth.dart';
// import '../ApiProvider/AllApi.dart';
// import '../home.dart';
//
// class AuthController extends GetxController {
//   StudentsAuth studentdata = StudentsAuth();
//
//   var is_loading = false.obs;
//   var student_name = ''.obs;
//   var student_reg = ''.obs;
//   var student_role = ''.obs;
//   var student_course_id = ''.obs;
//   var student_program_id = ''.obs;
//   var student_year = ''.obs;
//   var student_level = ''.obs;
//   var errorMessage = ''.obs;
//
//   TimetableController timetableController = Get.put(TimetableController());
//
//
//   Future myBottomSheent() async{
//     Get.bottomSheet(
//         Container(
//           margin: EdgeInsets.fromLTRB(1, 0, 1, 1),
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//             color: Colors.white,
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                   height: 100,
//                   child: Container(
//                     margin: EdgeInsets.all(10),
//                     child:Obx(()=>  TextField(
//                       keyboardType: TextInputType.number,
//                       decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(20)
//                           ),
//                           hintText: 'Eg, S30772/T.2020  $student_reg'
//                       ),
//                     ),
//                     ),
//                   )),
//               SizedBox(
//                 height: 100,
//                 child: Container(
//                   margin: EdgeInsets.all(10),
//                   child: TextField(
//                     obscureText: true,
//                     keyboardType: TextInputType.visiblePassword,
//                     decoration: InputDecoration(
//
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20)
//                         ),
//                         hintText: 'Enter Password'
//                     ),
//                   ),
//                 ),
//
//               ),
//               SizedBox(
//                 child: MaterialButton(
//                   color: Colors.deepOrange,
//                   onPressed: studentLogin,
//                   child: Icon(Icons.login),
//                 ),
//               )
//             ],
//           ),
//         )
//     );
//   }
//
//
//
//
//   Future<StudentsAuth> studentLogin() async {
//     is_loading.value = true;
//     try {
//       StudentsAuth student = StudentsAuth(
//         studentPassword: 'asha123',
//         studentReg: '30773/T.2023',
//       );
//
//       final url = Uri.parse(ApiUrls.auth);
//       var response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(student.toJson()),
//       );
//
//       if (response.statusCode == 200) {
//         is_loading.value = false;
//         var jsondata = jsonDecode(response.body);
//         studentdata = StudentsAuth.fromJson(jsondata);
//
// //         // Obtain shared preferences.
//         final SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('student_name', studentdata.studentName.toString());
//         await prefs.setString('student_reg', studentdata.studentReg.toString());
//         await prefs.setString('student_course_id',studentdata.courseId.toString() );
//         await prefs.setString('student_program_id',studentdata.programId.toString());
//         await prefs.setString('student_year', studentdata.year.toString());
//         await prefs.setString('student_level', studentdata.studentLevel.toString());
//         await prefs.setString('student_role', studentdata.studentRole.toString());
//
//         await loadData();
//         return studentdata;
//       } else {
//         is_loading.value = false;
//         var jsondata = jsonDecode(response.body);
//         errorMessage.value = jsondata['error'] ?? 'Unknown error';
//         Get.snackbar(
//           'Fail',
//           errorMessage.value,
//           snackPosition: SnackPosition.BOTTOM,
//           colorText: Colors.white,
//           backgroundColor: Colors.black,
//         );
//         throw Exception('Login failed: ${errorMessage.value}');
//       }
//     } catch (e) {
//       throw Exception('Error at: $e');
//     } finally {
//       is_loading.value = false;
//     }
//   }
//
//   Future<void> loadData() async {
//     final prefs = await SharedPreferences.getInstance();
//     student_name.value = prefs.getString('student_name') ?? '';
//     student_reg.value = prefs.getString('student_reg') ?? '';
//     student_course_id.value = prefs.getString('student_course_id') ?? '';
//     student_program_id.value = prefs.getString('student_program_id') ?? '';
//     student_year.value = prefs.getString('student_year') ?? '';
//     student_level.value = prefs.getString('student_level') ?? '';
//     student_role.value = prefs.getString('student_role') ?? '';
//
//     // fetch timetable after loading
//     if (student_program_id.value.isNotEmpty) {
//       timetableController.getTimetablePerCr(
//         student_program_id.value,
//         student_year.value,
//         student_level.value,
//         '', // default day
//         '', // default date
//       );
//     }
//   }
// }
