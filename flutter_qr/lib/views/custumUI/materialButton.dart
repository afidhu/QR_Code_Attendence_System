import 'package:flutter/material.dart';

class MyMaterialButton extends StatelessWidget {
  const MyMaterialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      // color: Colors.blueGrey,
        minWidth: 200,
        onPressed: (){},
      child: Icon(Icons.done_all,color: Colors.green,size: 20,),
    );
  }
}
