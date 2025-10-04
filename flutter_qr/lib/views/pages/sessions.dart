import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/seiionupdateController.dart';
import '../controller/sessionscontroller.dart';
import '../custumUI/sessionCard.dart';

class SessionsList extends StatefulWidget {
  const SessionsList({super.key});

  @override
  State<SessionsList> createState() => _SessionsListState();
}

class _SessionsListState extends State<SessionsList> {
  SessionsUpdateController sessionsUpdateControllerControllers =Get.put(SessionsUpdateController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child:Obx(()=>sessionsUpdateControllerControllers.isSessioned.value?Center(child: CircularProgressIndicator(color: Colors.black,backgroundColor: Colors.white,),):  ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: sessionsUpdateControllerControllers.SessionsList.length,
            itemBuilder: (context,index){
              var myindex=index;
              var data =sessionsUpdateControllerControllers.SessionsList[index];
              return SessionCard(allsessions: data,allsessionsIndex: myindex.toInt(), );
            }
        ),
        )
        )
    );

  }
}


