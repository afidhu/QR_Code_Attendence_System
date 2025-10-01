import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class MyDrawerNavigation extends StatefulWidget {
  const MyDrawerNavigation({super.key});

  @override
  State<MyDrawerNavigation> createState() => _MyDrawerNavigationState();
}

class _MyDrawerNavigationState extends State<MyDrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.white70),
      ),
      elevation: 10,
        shadowColor: Colors.deepOrange,
        backgroundColor: Colors.grey,
         child: Container(
           margin: EdgeInsets.all(20),
           child: Column(
             children: [
               ListTile(
                 leading: Icon(Icons.home),
                 title: Text('Home'),
               ),
               Divider(height: 1,color: Colors.black,endIndent: 10.1,),

               ListTile(
                 onTap: (){
                   Get.bottomSheet(
                     Container(
                       margin: EdgeInsets.fromLTRB(1, 1, Get.width*0.2, 1),
                       width: Get.width*1.0,
                       height: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.white,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisSize: MainAxisSize.max,
                         children: [
                           Text('Change App Theme'),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Icon(Icons.color_lens),
                               MaterialButton(
                                   onPressed: (){
                                     Get.changeTheme(ThemeData.dark());
                                   },
                                 child: Text('Dark'),
                               )
                             ],
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Icon(Icons.color_lens),
                               MaterialButton(
                                 onPressed: (){
                                   Get.changeTheme(ThemeData.light());

                                 },
                                 child: Text('white'),
                               )
                             ],
                           )


                         ],
                       ),
                     )
                   );
                 },

                 leading: Icon(Icons.settings),
                 title: Text('Setting'),
               )
             ],
           ),
         ),

    );
  }
}
