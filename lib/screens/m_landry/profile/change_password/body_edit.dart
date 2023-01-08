import 'package:course_app/screens/home/widget/Bottom_bar.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyEdit extends StatelessWidget {
  String name, email;
  BodyEdit({required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Profile Information".tr,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            MenuForm(
              name: name,
              email: email,
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class MenuForm extends StatefulWidget {
  String name, email;

  MenuForm({required this.name, required this.email});

  @override
  State<MenuForm> createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  final List<String> errors = [];
  TextEditingController password = TextEditingController();
  TextEditingController password_check = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 20,
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
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: widget.email ?? "",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1)),
            ),
          ),

          SizedBox(
            height: 20,
          ),
          Text(
            "Change passsword".tr,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
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
              controller: password,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "new passsword",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1)),
            ),
          ),
          // TextFormField(
          //   controller: password,
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     hintText: "new passsword".tr,
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //     contentPadding: EdgeInsets.symmetric(
          //       horizontal: 42,
          //       vertical: 20,
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: BorderSide(color: Colors.blue),
          //       gapPadding: 10,
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: BorderSide(color: Colors.blue),
          //       gapPadding: 10,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 20,
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
              controller: password_check,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "confirm passsword",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintStyle: TextStyle(height: 1)),
            ),
          ),
          // TextFormField(
          //   controller: password_check,
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     hintText: "confirm passwoed".tr,
          //     floatingLabelBehavior: FloatingLabelBehavior.always,
          //     contentPadding: EdgeInsets.symmetric(
          //       horizontal: 42,
          //       vertical: 20,
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(12),
          //       borderSide: BorderSide(color: Colors.blue),
          //       gapPadding: 10,
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(124),
          //       borderSide: BorderSide(color: Colors.blue),
          //       gapPadding: 10,
          //     ),
          //   ),
          // ),
          // ////////////////////
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  if (password_check.text.toString() !=
                      password.text.toString()) {
                    Get.snackbar('Wrong ', '  password dont match',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.black,
                        colorText: Colors.white);
                  } else {
                    changePawword();
                    Get.off(BottomBar());
                  }
                },
                child: AnimatedContainer(
                  width: 130,
                  height: 48,
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 38, 83, 122)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "حفظ",
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
                width: 30,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(130.0, 48.0),
                    side: BorderSide(color: Colors.blue)),
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  "الغـاء",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: SizedBox(
          //     height: 55,
          //     width: double.infinity,
          //     child: FlatButton(
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20)),
          //         color: Colors.blue[800],
          //         onPressed: () {
          //           if (password_check.text.toString() !=
          //               password.text.toString()) {
          //             Get.snackbar('Wrong ', '  password didnot match',
          //                 snackPosition: SnackPosition.BOTTOM,
          //                 backgroundColor: Colors.red,
          //                 colorText: Colors.white);
          //           } else {
          //             changePawword();
          //             Get.off(BottomBar());
          //           }
          //         },
          //         child: Text(
          //           "save".tr,
          //           style: TextStyle(
          //             fontSize: 18,
          //             color: Colors.white,
          //           ),
          //         )),
          //   ),
          // ),
        ],
      ),
    );
  }

  changePawword() async {
    User? user = FirebaseAuth.instance.currentUser;
    print("user==========" + user.toString());
    await user!.updatePassword(password.text.toString());
    Get.snackbar('تم ', ' تم تغير الباسورد بنجاح ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white);
    // Get.off(EditProfile());
    // FirebaseAuth.instance.signOut();
    // Get.offAll(ControlView());
  }
}
