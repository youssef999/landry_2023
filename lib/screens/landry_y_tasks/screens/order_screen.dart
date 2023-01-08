

  
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/screens/details_screen.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/item_model.dart';

class OrderScreen extends StatelessWidget {

    String cat,price,address,address2,city,country,status,code;
    List order;
    List pricing;
    String latLong;
    String placeMark;
    String time1;
    String time2;
    String phone;
     String date1;
     String date2;
     double services;
   List <ItemModel>items;
    OrderScreen({required this.cat, required this.price, required this.order,required this.pricing,
    required this.country,required this.city,required this.address,required this.address2
      ,required this.code,required this.status,required this.latLong,required this.placeMark,
      required this.time1,required this.time2,required this.phone,required this.date1,required this.date2,
      required this.items,required this.services
    });

  @override
    Widget build(BuildContext context) {
    final controller=Get.put(OrderController());
      return Scaffold(
        body:Padding(
          padding: const EdgeInsets.only(left:20.0,right: 20,top:6),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(onPressed: (){

                    Get.back();

                  }, icon: Icon(Icons.arrow_back_ios_sharp)),
                  SizedBox(width: 60,),
                  Custom_Text( text: "ملخص الطلب",
                    fontSize:18,
                    color:Colors.black,
                    alignment:Alignment.center,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // الاستلام
              Column(
                children: [
                  Custom_Text(text: "الاستلام",
                  fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:date1,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:time1,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
             // التوصيل
              Column(
                children: [
                  Custom_Text(text: "توصيل",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: date2,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: time2,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              //العنوان
              Column(
                children: [
                  Custom_Text(text: " عنوان الاستلام ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: address,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              //العنوان
              Column(
                children: [
                  Custom_Text(text: " عنوان التسليم ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text:address2,
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: city ,
                    fontSize:14,
                    color:Colors.black54,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              Divider(
                color:Colors.black54,
              ),
              // طريقة الدفع
              Column(
                children: [
                  Custom_Text(text: " طريقة الدفع ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  Custom_Text(text: "الدفع عند الاستلام ",
                    fontSize:17,
                    color:Colors.black,
                    alignment:Alignment.topLeft,
                  ),

                ],
              ),
              SizedBox(height: 10),
              // الطلب
              Column(
                children: [
                  Custom_Text(text: " الطلب ",
                    fontSize:11,
                    color:Colors.grey,
                    alignment:Alignment.topLeft,
                  ),
                  SizedBox(height: 10),
                  for(int i=0;i<items.length;i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width:120,
                          child: Custom_Text(
                            text: items[i].name.toString()
                                .replaceAll('[', '').replaceAll(']',''),
                            fontSize:13,
                            color:Colors.black87,
                            alignment:Alignment.topLeft,
                          ),
                        ),
                        SizedBox(width: 30,),
                        Custom_Text(
                          text: "=",
                          fontSize:13,
                          color:Colors.black87,
                          alignment:Alignment.topLeft,
                        ),
                        SizedBox(width: 40,),
                        Custom_Text(
                          text: items[i].price.toString()
                              .replaceAll('[', '').replaceAll(']',''),
                          fontSize:13,
                          color:Colors.red,
                          alignment:Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),
                  Divider(
                    color:Colors.black87,
                  ),
                Row(
                  children: [
                    Custom_Text(text: 'سعر الخدمة    =  ',
                      color: Colors.black,
                      alignment:Alignment.center,
                    ),
                    SizedBox(width: 120,),
                    Custom_Text(text: services.toString(),
                    color: Colors.red,
                      alignment:Alignment.center,
                    ),
                  ],
                ),
                  Divider(
                    color:Colors.black87,
                  ),
                  Row(
                    children: [
                      Custom_Text(text: "المجموع",
                      fontSize:17,
                        color:Colors.black,
                      ),
                      SizedBox(width: 100,),
                      Custom_Text(text: (double.parse(price)+services).toStringAsFixed(2),
                        fontSize:15,
                        color:Colors.red,
                      ),
                    ],
                  )
                ],
              ),


              SizedBox(height: 20),

              // رمز الخصم
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
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
                    controller: controller.codeX,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    onSaved: (value) {},
                    validator: (value) {},
                    decoration: InputDecoration(
                        hintText: "الـرمز الخصم ",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(0),
                        hintStyle: TextStyle(height: 1)),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Center(
                child: Container(
             //   color: Colors.blue,
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(15),
                    color: Colors.blue
                  ),
                  child:Custom_Text(
                    text: "خصم 20 % ",
                    color:Colors.white,
                    alignment:Alignment.center,
                  ),
                ),
              ),
              // اكد الطلب
              SizedBox(height: 20),
              GetBuilder(
                init: OrderController(),
                builder: (context) {
                  return RaisedButton(
                    color:Colors.blueAccent,
                      child:Custom_Text(
                        alignment:Alignment.center,
                        text: "اكد الطلب ",
                        fontSize:18,
                        color:Colors.white,
                      ),
                      onPressed:() async {
                      List <ItemModel >data=[];
                      List names=[];


                        for(int i=0;i<items.length;i++){
                          ItemModel item=ItemModel( items[i].name.toString(),  items[i].price.toString());
                          data.add(item);
                          names.add(items[i].name);
                        }
                        print('data==='+data.toString());







                      // services: posts['services'],
                      //   city: posts['city'],
                      //   country: posts['country'],
                      //   cat: posts['cat'],
                      //   price: posts['price'],
                      //   items: posts['order'],
                      //   date1:posts['date1'],
                      //   date2:posts['date2'],
                      //   address: posts['address'],
                      //   address2: posts['address2'],
                      //   time1: posts['time1'],
                      //   time2:posts['time2']



                       controller.confirmOrder(
                           names, address.toString(),
                           address2.toString(),
                           (double.parse(price)+services).toStringAsFixed(2),
                         city.toString(),status.toString(),country.toString(),code.toString(),
                         cat.toString(),services,
                         latLong.toString(),placeMark.toString(),time1.toString(),time2.toString(),
                         date1.toString(),date2.toString()
                       );
                       names=[];
                       data=[];
                       pricing=[];

                      // print("wwww");
                      // final box=GetStorage();
                      // String email=box.read('email')??"";
                      // String check=box.read('check')??"";
                  });
                }
              )
            ],
          ),
        ),
      );
    }
  }
  