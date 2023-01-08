//import 'dart:html';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  List<RemoteMessage> _message = [];
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message = [..._message, message];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_message.isEmpty) {
      return const Text("لا يوجد رسائل حتي الان");
    }
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _message.length,
      itemBuilder: (context, index) {
        RemoteMessage message = _message[index];
        return ListTile(
          title: Text(
            message.notification?.title ?? "S/D",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle:
              Text(message.sentTime?.toString() ?? DateTime.now().toString()),
          trailing: Icon(
            Icons.notifications_active,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
