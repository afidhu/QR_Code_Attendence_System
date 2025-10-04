import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_qr/views/ApiProvider/AllApi.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/sessionModel.dart';

class SessionsController extends GetxController {
  TextEditingController controllerMinute = TextEditingController();

  var SessionsData = Sessions().obs;
  var SessionsList = <Sessions>[].obs;
  var SessionsId = 0.obs;
  var isSessioned = false.obs;
  Future<Sessions> CreateSession(int timetableId) async {
    try {
      int expiredtime = int.tryParse(controllerMinute.text) ?? 0;
      Sessions session = Sessions(
        expiredTime: expiredtime,
        timetableId: timetableId,
      );

      final url = Uri.parse(ApiUrls.sessions);
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(session.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("data are ${response.body}");

        final urlTimeTable = Uri.parse('${ApiUrls.timetable}/$timetableId');
        var response2 = await http.put(
          urlTimeTable,
          headers: {'Content-Type': 'application/json'},
        );
        if (response2.statusCode == 200 || response2.statusCode == 201) {
          isSessioned.value = true;
          print("timetable are ${response2.body}");
        } else {
          print('fail to update table erorr at ${response2.body}');
        }

        var jsondata = jsonDecode(response.body);
        var jsonObject = jsondata['data'];
        var sessionData = Sessions.fromJson(jsonObject);
        print(('session id is ${sessionData.sessionId}'));
        SessionsId.value = sessionData.sessionId!;
        return sessionData;
      } else {
        print('fail to post data erorr at ${response.body}');
        return session;
      }
    } catch (e) {
      throw Exception('error at : $e');
    } finally {}
  }



  Future<List<Sessions>> getAllSession() async {
    try {
      print('object');
      final url = Uri.parse(ApiUrls.sessions);
      var response = await http.get(url);
      print('data are ${response}');
      if (response.statusCode == 200) {
        print('data are ${response.body}');
        var jsonList = jsonDecode(response.body);
        var sessionlist = jsonList
            .map((json) => Sessions.fromJson(json))
            .toList();
        SessionsList.assignAll(sessionlist);
        return SessionsList;
      } else {
        print('fail to get data erorr at ${response.body}');
        return SessionsList;
      }
    } catch (e) {
      throw Exception('error at : $e');
    }
  }
}
