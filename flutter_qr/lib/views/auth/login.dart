import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/authcontroller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  AuthController authController =Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

          child: Column(
            children: [
              // Text('Student Attendance Portal'),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 200,
                    spreadRadius: 1,
                    offset: Offset(11, 20)
                  )
                ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                    child: Image.asset('images/logo.jpg',cacheHeight: 600,cacheWidth: 700, fit: BoxFit.fill,height: 450,width:double.infinity)),
              ),

              SizedBox(height: 30,),

              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size.fromWidth(200)),
                    backgroundColor: WidgetStatePropertyAll(Colors.orange)
                  ),
                    onPressed: authController.myBottomSheent,
                    child:Text('Login')
                ),
              ),
            ],

          ),
        ),
    );
  }
}

