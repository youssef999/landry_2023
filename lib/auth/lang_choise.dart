import 'package:course_app/Local/Language_body.dart';
import 'package:course_app/auth/language_body2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LanguageChoice extends StatelessWidget {
  const LanguageChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LanguageBody2(),
    );
  }
}
