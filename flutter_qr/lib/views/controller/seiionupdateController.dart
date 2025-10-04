import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_qr/views/ApiProvider/AllApi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/sessionModel.dart';

class SessionsUpdateController extends GetxController {

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await Future.delayed(Duration(seconds: 1),() => {
      getAllSession()
    },);
  }
  var SessionsList = <Sessions>[].obs;
var isSessioned = true.obs;

  Future<List<Sessions>> getAllSession() async {
    try {
      print('object');
      final url = Uri.parse(ApiUrls.sessions);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        var sessionlist = jsonList
            .map((json) => Sessions.fromJson(json)).toList();
        print('data are ${response.body}');
        SessionsList.assignAll(sessionlist);
        isSessioned.value =false;
        return SessionsList;
      } else {
        print('fail to get data erorr at ${response.body}');
        return [];
      }
    } catch (e) {
      isSessioned.value =false;
      throw Exception('error at : ${e.toString()}');
    }
  }
}
