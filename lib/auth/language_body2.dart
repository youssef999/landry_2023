import 'package:course_app/Local/local_controller.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/profile/profile_pic.dart';
import 'package:course_app/screens/profile/profile_pic2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageBody2 extends GetView<MyLocalController> {
  const LanguageBody2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _value = 1;
    final box = GetStorage();
    String name = box.read('name') ?? "";
    String email = box.read('email') ?? "";
    MyLocalController controllerLang = Get.find();

    return Column(
      children: [
        SizedBox(height: 150),
        ProfilePic2(),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Row(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                " ,مرحبا",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Text(
          "يرجي اختيار لغتك لتسهيل الاتصال",
          style: TextStyle(fontSize: 23, color: Colors.grey),
        ),
        BoxRadio()
      ],
    );
  }
}

class BoxRadio extends StatefulWidget {
  @override
  State<BoxRadio> createState() => _BoxRadioState();
}

class _BoxRadioState extends State<BoxRadio> {
  @override
  Widget build(BuildContext context) {
    int? _value = 2;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as int;
                  });
                }),
            SizedBox(
              width: 3,
            ),
            Text("Radio 1"),
            SizedBox(
              width: 20,
            ),
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value as int;
                  });
                }),
            SizedBox(
              width: 3,
            ),
            Text("Radio 2"),
          ],
        ));
  }
}
