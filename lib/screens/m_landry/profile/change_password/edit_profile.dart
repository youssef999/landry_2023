
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get_storage/get_storage.dart';

import 'body_edit.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String email = box.read('email');
    String name = box.read('name');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Edit profile".tr,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Reboto"),
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme:
        //     TextTheme(headline6: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      body: BodyEdit(
        name: name,
        email: email,
      ),
    );
  }
}
