import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        "لا يوجـد اشعـارات حتي الان",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
