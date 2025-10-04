import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/updateTimetableController.dart';

class MyMaterialButton extends StatefulWidget {
  final int tametable_id;
  const MyMaterialButton({super.key, required this.tametable_id});

  @override
  State<MyMaterialButton> createState() => _MyMaterialButtonState();
}

class _MyMaterialButtonState extends State<MyMaterialButton> {
  UpdateTimetableController updateTimetableController = Get.put(UpdateTimetableController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
        MaterialButton(
        // color: Colors.blueGrey,
        minWidth: 200,
        onPressed: (){},
        child: Icon(Icons.done_all,color: Colors.green,size: 20,),
      ),
          FilledButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.green)
            ),
              onPressed: (){
                updateTimetableController.updateTimetable(widget.tametable_id);
              },
              child: Icon(Icons.edit_note,color: Colors.blue,size: 30, )
          )
        ],
      ),
    );
  }
}
