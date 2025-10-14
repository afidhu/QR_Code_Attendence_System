import 'package:flutter/material.dart';
import 'package:flutter_qr/model/sessionModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/seiionupdateController.dart';


class SessionCard extends StatelessWidget {
  final Sessions allsessions;
  final int  allsessionsIndex;
  const SessionCard({super.key, required this.allsessions, required this.allsessionsIndex,});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        Get.find<SessionsUpdateController>().getAllSession();
      },
      child: Card(
        child: ListTile(
          onTap: (){},
          leading: CircleAvatar(child: Text('${allsessionsIndex+1}'),),
          title: Text('Date:${DateFormat('dd MMM yyyy').format(DateTime.parse(allsessions.createdAt.toString()))}', style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Column(
                   children: [
                     Row(
                       children: [
                         Text('Time:'),
                         Text(DateFormat('HH:mm:ss').format(DateTime.parse(allsessions.createdAt.toString())), style: TextStyle(fontWeight: FontWeight.bold), )
                       ],
                     )
                   ],
                 ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text('Expired:'),
                          Text('${allsessions.expiredTime} min',style: TextStyle(fontWeight: FontWeight.bold),  )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          trailing: Icon(Icons.print,color: Colors.cyan,),
        ),
      ),
    );
  }
}
