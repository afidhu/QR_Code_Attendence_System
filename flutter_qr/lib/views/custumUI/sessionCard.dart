import 'package:flutter/material.dart';
import 'package:flutter_qr/model/sessionModel.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SessionCard extends StatelessWidget {
  final Sessions allsessions;
  final int allsessionsIndex;

  const SessionCard({
    super.key,
    required this.allsessions,
    required this.allsessionsIndex,
  });

  @override
  Widget build(BuildContext context) {
    final createdAt = DateTime.parse(allsessions.createdAt.toString());

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 2,
      child: ListTile(
        onTap: () {},
        leading: CircleAvatar(
          backgroundColor: Colors.cyan,
          child: Text(
            '${allsessionsIndex + 1}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          'Date: ${DateFormat('dd MMM yyyy').format(createdAt)}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Time Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Time:'),
                  Text(
                    DateFormat('HH:mm:ss').format(createdAt),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              /// Expired Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Expired:'),
                  Text(
                    '${allsessions.expiredTime} min',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: const Icon(
          Icons.print,
          color: Colors.cyan,
        ),
      ),
    );
  }
}
