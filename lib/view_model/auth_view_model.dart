import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';

import 'package:course_app/servies/firestore_user.dart';
import 'package:course_app/view_model/controle_view.dart';
import 'package:course_app/view_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthViewModel extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email, password, name, phone;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;

  final LocalStorgeData localStorgeData = Get.find();
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword () async {
    final box = GetStorage();
    box.write('email',emailController.text);
    //  String name1=box.read('name')??"";
    String email1 = box.read('email') ?? "";

    try {
      await _auth
          .signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
          .then((value) async {
        print("ccc=======");
        Get.offAll(BottomBar());
      });
    } catch (e) {
      print(e.toString());

      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signupWithEmailAndPassword() async {
    final box = GetStorage();

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        print("e==" + email);
        print("e==" + name);

        box.write('email', email);
        box.write('name', name);

        saveUser(user);
        Get.offAll(ControleView());
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error Login Account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void ResetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        Get.to(ControleView());
        Get.snackbar('تم',
            'ارسلنا لك رابط علي الايميل تستطيع اعادة كلمة المرور من خلاله',
            backgroundColor: Colors.black,
            colorText: Colors.white,
            duration: Duration(seconds: 5));
      });
    } on FirebaseAuthException catch (e) {
      print("PPP" + e.code);
      // print("eeee="+e.message);

      Get.snackbar('خطا', 'تاكد من ان هذا الايميل صحيح و مسجل بالفعل ',
          backgroundColor: Colors.black,
          colorText: Colors.white,
          duration: Duration(seconds: 5));
// show the snackbar here
    }
    //   _auth.sendPasswordResetEmail(email: email);
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      email,
      name,
      user.user!.uid,
      phone,
    );

    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorgeData.setUser(userModel);
  }
}
