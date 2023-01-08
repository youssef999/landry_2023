//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/landry_y_tasks/screens/order_screen.dart';
import 'package:course_app/screens/m_landry/profile2/proffilee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewAddressScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 1,
          title: Text(
            "اضف عنوان",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: GetBuilder(
              init: OrderController(),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 7,
                          )
                        ]),
                    height: 1200,
                    width: double.infinity,
                    //   color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "شارع",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                              controller: controller.address,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              onSaved: (value) {},
                              validator: (value) {},
                              decoration: InputDecoration(
                                  hintText: "شارع  ",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.address2,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: " ",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.phone,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: "رقم الهاتف",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
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
                              controller: controller.city,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              onSaved: (value) {},
                              validator: (value) {},
                              decoration: InputDecoration(
                                  hintText: "المدينـة",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.time1,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: "وقت الاستلام ",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.time2,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: "وقت التسليم ",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.date1,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: " تاريخ الاستلام ",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(right: 10, left: 10),
                        //   child: Container(
                        //     height: 50,
                        //     padding: const EdgeInsets.symmetric(horizontal: 10),
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //         borderRadius: BorderRadius.circular(6),
                        //         boxShadow: [
                        //           BoxShadow(
                        //             color: Colors.black.withOpacity(0.1),
                        //             blurRadius: 7,
                        //           )
                        //         ]),
                        //     child: TextFormField(
                        //       controller: controller.date2,
                        //       keyboardType: TextInputType.text,
                        //       obscureText: false,
                        //       onSaved: (value) {},
                        //       validator: (value) {},
                        //       decoration: InputDecoration(
                        //           hintText: " تاريخ التسليم ",
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.all(0),
                        //           hintStyle: TextStyle(height: 1)),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
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
                              controller: controller.status,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              onSaved: (value) {},
                              validator: (value) {},
                              decoration: InputDecoration(
                                  hintText: "حــالة",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              controller: controller.country,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              onSaved: (value) {},
                              validator: (value) {},
                              decoration: InputDecoration(
                                  hintText: "دولة",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                              controller: controller.code,
                              keyboardType: TextInputType.text,
                              obscureText: false,
                              onSaved: (value) {},
                              validator: (value) {},
                              decoration: InputDecoration(
                                  hintText: "الـرمز البـريدي",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(0),
                                  hintStyle: TextStyle(height: 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 42,
                        ),
                        InkWell(
                          onTap: () async {

                            print("wwww");
                            final box=GetStorage();
                           String email=box.read('email')??"";
                            await FirebaseFirestore.instance
                                .collection('address')
                                .add({
                              "name": controller.address.text,
                              "email":email,
                              "status": controller.status.text,
                              "city": controller.city.text,
                              "country": controller.country.text,
                              "code": controller.code.text,
                            }).then((value) {

                              Get.to(Prooffilee2());

                            }
                            );

                          },
                          child: AnimatedContainer(
                            width: 330,
                            height: 48,
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(
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
                                  "حفظ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
