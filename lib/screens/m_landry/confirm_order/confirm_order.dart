import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/landry_y_tasks/screens/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ConfirmOrderScreen extends StatelessWidget {
  String total,code;


  ConfirmOrderScreen({required this.total, required this.code});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "شكرا لـك",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Image.asset("assets/images/Background (7) (1).png"),
            ),
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
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
                height: 210,
                width: double.infinity,
                child: Column(children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          "الرقم التعريفي الخاص بالطلب",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E9E9E),
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Text(
                          code,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "الـدفع",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E9E9E),
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, top: 5),
                      //   child: Text(
                      //     "7643456",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey,
                      //         fontSize: 17),
                      //   ),
                      // ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "السـعر الكـلي",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9E9E9E),
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        width: 130,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                        total,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Get.off(HistoryScreen(
                          x: 'x',
                        ));
                      },
                      child: Text(
                        "تتبـع الطـلبات",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.blue),
                      ),
                    ),
                  ),
                ]),
              ),
            )),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
               total,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(
                "لقد دفعت العنصر الخاص بك وجار في العملية",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            InkWell(
              onTap: () {
                Get.off(BottomBar());
              },
              child: AnimatedContainer(
                width: 330,
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
                      "انتقل للرئيسية",
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
    );
  }
}
