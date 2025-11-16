import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/seiionupdateController.dart';
import '../custumUI/sessionCard.dart';

class SessionsList extends StatefulWidget {
  const SessionsList({super.key});

  @override
  State<SessionsList> createState() => _SessionsListState();
}

class _SessionsListState extends State<SessionsList> {
  final SessionsUpdateController sessionsUpdateController =
  Get.put(SessionsUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Sessions",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (sessionsUpdateController.isSessioned.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
          );
        }

        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sessionsUpdateController.SessionsList.length,
          itemBuilder: (context, index) {
            final data = sessionsUpdateController.SessionsList[index];
            return SessionCard(
              allsessions: data,
              allsessionsIndex: index,
            );
          },
        );
      }),
    );
  }
}
