import 'package:course_app/auth/Sign_up.dart';
import 'package:course_app/auth/forget_password.dart';
import 'package:course_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    super.initState();
  }

  String? log;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // late String email, password;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthViewModel>(
      builder: (controller) => Scaffold(
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
                            "مرحبا بعودتـك",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w900),
                          )),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            "تسجيل الدخول للمتابعة".tr,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              //fontWeight: FontWeight.w900
                            ),
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
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          onSaved: (value) {
                            controller.emailController.text = value!;
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
                        height: 10,
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
                          controller: controller.passwordController,
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
                              hintText: "4".tr,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(0),
                              hintStyle: TextStyle(height: 1)),
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // Checkbox(
                          //     value: true,
                          //     activeColor: Colors.blue,
                          //     onChanged: (Value) {}),
                          // Text(
                          //   "تذكرني",
                          //   style: TextStyle(fontSize: 15, color: Colors.grey),
                          // ),
                          Spacer(),
                          GestureDetector(
                            child: InkWell(
                              onTap: () {
                                Get.to(ResetPassword());
                              },
                              child: Text("هل نسيت كلمة السر ؟",
                                  style: TextStyle(
                                      //     decoration: TextDecoration.underline,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      InkWell(
                        onTap: () {
                          _formKey.currentState!.save();
                          if (_formKey.currentState!.validate()) {
                            controller.signInWithEmailAndPassword();
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
                      SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        icon: SvgPicture.asset(
                          "assets/icons/Facebook.svg",
                          height: 20,
                          width: 20,
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minimumSize: Size(330.0, 48.0),
                            side: BorderSide(color: Colors.blue)),
                        onPressed: () {},
                        label: Text("قم بتسجيل الدخول باسنخدام الفيسبوك"),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     SvgPicture.asset(
                        //       "assets/icons/Facebook.svg",
                        //       height: 20,
                        //       width: 20,
                        //     ),
                        //     SizedBox(
                        //       width: 5,
                        //     ),
                        //     Text(
                        //       "قم بتسجيل الدخول باسنخدام الفيسبوك",
                        //       style: TextStyle(fontSize: 15),
                        //     )
                        //   ],
                        // )
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // SocialMedia(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () {
                                Get.to(SignUpScreen());
                              },
                              child: Text(
                                "اشترك",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 19),
                              )),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "ليس لديك حساب؟",
                            style: TextStyle(color: Colors.grey, fontSize: 19),
                          ),

                        ],
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
