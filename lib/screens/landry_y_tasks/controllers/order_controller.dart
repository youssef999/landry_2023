

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/m_landry/confirm_order/confirm_order.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OrderController extends GetxController {

TextEditingController address=TextEditingController();
TextEditingController address2=TextEditingController();
TextEditingController city=TextEditingController();
TextEditingController status=TextEditingController();
TextEditingController country=TextEditingController();
TextEditingController code=TextEditingController();
TextEditingController codeX=TextEditingController();
TextEditingController time1=TextEditingController();
TextEditingController time2=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController date1=TextEditingController();
TextEditingController date2=TextEditingController();




  confirmOrder(

      List  order,String  ? address,
      String ? address2,
      String ? total,
      String ? city,String ? status,String ? country,String  ? code,
      String  cat,double services,
      String latLong,String placeMark,
      String t1,String t2,String date1,String date2
      )async{


    const _chars = '2345698769303843303948272731234567890';
    Random _rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    String r1=getRandomString(3);
    String r2=getRandomString(5);
    String r3=getRandomString(4);
    String code_num=r1+r2+r3;
    final box=GetStorage();
    String name=box.read('name')??"";
    String email=box.read('email')??"";

    await FirebaseFirestore.instance
        .collection('orders')
        .add({
      "user_name": name,
      "email":email,
      "progress":10,
      "order": order,
      "address1": address,
      "address2":address2,
      "date1":date1,
       "date2":date2,
       "cat":cat,
      "services":services,
      "total": total,
      "city":city,
      "code_num":code_num,
      "country":country,
      "status":'جاري التنفيذ',
      "code":code,
      "latLong":latLong,
      "placeMark":placeMark,
      "time1":t1,
      "time2":t2
    }).then((value) {


           order=[];



      // const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
      // Random _rnd = Random();

      // String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      //     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
      //
      // String r1=getRandomString(3);
      // String r2=getRandomString(5);
      // String r3=getRandomString(2);

      Get.offAll(ConfirmOrderScreen(
        total: total.toString(),
        code: code_num
      ));
      //order=[];
    });
  }



}