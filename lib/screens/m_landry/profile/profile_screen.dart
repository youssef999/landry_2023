
import 'package:course_app/screens/m_landry/profile/profile.dart';
import 'package:course_app/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen2 extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.black,
            title: Text(
              "اعدادات",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: ProfileHome2(),
          )),
    );
  }
}
