import 'package:course_app/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../view_model/auth_view_model.dart';

class SignUpScreen extends GetWidget<AuthViewModel> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController LevelController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 1,
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
                      height: 50,
                    ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "مرحبا".tr,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.w900),
                        )),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "سجل للانضمام".tr,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            //fontWeight: FontWeight.w900
                          ),
                        )),
                    SizedBox(
                      height: 40,
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
                        controller: NameController,
                        keyboardType: TextInputType.text,
                        obscureText: false,
                        onSaved: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "7".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                      height: 15,
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
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "كلمة المرور".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        obscureText: false,
                        onSaved: (value) {
                          controller.phone = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "موبايل",
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
                          controller.signupWithEmailAndPassword();
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
                              "اشتراك",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 19),
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          " لديك حساب؟",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                        // InkWell(
                        //     onTap: () {
                        //       Get.to(SignUpScreen());
                        //     },
                        //     child: Text(
                        //       "اشترك",
                        //       style:
                        //           TextStyle(color: Colors.blue, fontSize: 16),
                        //     )),
                      ],
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    //  SocialMedia(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({Key? key}) : super(key: key);

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
