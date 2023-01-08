import 'package:course_app/auth/Sign_up.dart';
import 'package:course_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../view_model/auth_view_model.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String? log;
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "نسيت كلمة المرور",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            "ادخل بريدك الالكتروني وسوف نرسل لك",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            "تعليمات حول كيفية اعادة تعيين".tr,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 7,
                              )
                            ]),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onSaved: (value) {
                            controller.email = value!;
                          },
                          validator: (value) {
                            if (value == null) {
                              print("Error");
                            }
                          },
                          decoration: InputDecoration(
                              hintText: "3".tr,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(height: 1)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InkWell(
                        onTap: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.ResetPassword();
                          }
                        },
                        child: AnimatedContainer(
                          width: 330,
                          height: 48,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.blue,
                                Color.fromARGB(255, 38, 83, 122)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
