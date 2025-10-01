import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';


class GetDeviceInfo extends GetxController {


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDeviceInfo();
  }


  var device_name = ''.obs;
  var device_Unique_Id = ''.obs;
  var device_manufature = ''.obs;

  Future<void> getAllDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.device}'); // e.g. a05
    print('Device manufacture is: ${androidInfo.manufacturer}');

    final mobileDeviceIdentifier = await MobileDeviceIdentifier().getDeviceId();
    print('Device Id:  $mobileDeviceIdentifier');

    if(mobileDeviceIdentifier!=null){
      device_name.value = androidInfo.device;
      device_Unique_Id.value = mobileDeviceIdentifier!;
      device_manufature.value = androidInfo.manufacturer;
    }
  }
}