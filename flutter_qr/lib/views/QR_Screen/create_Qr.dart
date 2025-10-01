import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controller/sessionscontroller.dart';
import 'Timreader.dart';

class CreateQr extends StatefulWidget {
  const CreateQr({super.key});

  @override
  State<CreateQr> createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQr> {


  SessionsController sessionsController = Get.put(SessionsController());
  bool showQr = false;

  var timetable_id =Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: showQr
            ? Text(
          "Please Scan QR Code \nBellow Within ${sessionsController.controllerMinute.text} min",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 22),
        )
            : Text("Create QR  "),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (showQr)
                TimeCounter(
                  minutescount: int.tryParse(sessionsController.controllerMinute.text) ?? 0,
                  onExpire: () {
                    setState(() {
                      sessionsController.controllerMinute.clear();
                      showQr = false; // hide QR
                    });
                  },
                ),

              if (showQr)
              Obx(()=>  QrImageView(
                  data: sessionsController.SessionsId.value.toString(),
                  version: QrVersions.auto,
                  size: 350,
                ),
              ),
              if (!showQr) ...[
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: sessionsController.controllerMinute,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Expired Time (minutes)',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    sessionsController.CreateSession(timetable_id);
                    if (sessionsController.controllerMinute.text.isNotEmpty) {
                      setState(() {
                        showQr = true;
                      });
                    }
                  },
                  child: Text("Generate QR Code ${timetable_id}", style: TextStyle(fontSize: 18, color: Colors.white))),
              ]
            ],
          ),
        ),
      ),
    );
  }
}



