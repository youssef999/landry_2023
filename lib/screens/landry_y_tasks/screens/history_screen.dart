import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/screens/track_orders.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryScreen extends StatelessWidget {
  String x;


  HistoryScreen({required this.x});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String e = box.read('email') ?? "";
    if(x=='x')
      {
        return Scaffold(
          appBar: AppBar(
            title: Custom_Text(
              text: "الطلب",
              color: Colors.black,
              fontSize: 20,
              alignment: Alignment.center,
            ),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.grey[200],
          bottomNavigationBar:

          InkWell(
            child: Container(
              height:60,
              color:Colors.blue,
              child: Custom_Text(
                text: "عودة للرئيسية ",
                color:Colors.white,
                 fontSize: 20,
                alignment:Alignment.center,
              ),
            ),
            onTap:(){
              Get.offAll(BottomBar());
            },
          ),
          body: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .where('email', isEqualTo: e)
                      .snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: CircularProgressIndicator());
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.data!.docs.length > 0) {
                          return GetBuilder(
                              init: OrderController(),
                              builder: (context) {
                                return Container(
                                  height: 3000,
                                  child: ListView.builder(
                                    //scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder: (BuildContext context,
                                          int index) {
                                        DocumentSnapshot posts =
                                        snapshot.data!.docs[index];

                                        return InkWell(
                                          child: Container(
                                            width: 50,
                                            height: 130,
                                            child: Card(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Directionality(
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Container(
                                                              width: 70,
                                                              height: 35,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      20),
                                                                  color: Colors
                                                                      .blueAccent),
                                                              child:
                                                              Custom_Text(
                                                                text: "" +
                                                                    posts[
                                                                    'status'],
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                alignment:
                                                                Alignment
                                                                    .center,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          width: 60,
                                                        ),
                                                        Text(
                                                          "رقم الطلب " +
                                                              " :  " +
                                                              posts[
                                                              'code_num'],
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold,
                                                            color:
                                                            ColorManager
                                                                .black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Directionality(
                                                    textDirection:
                                                    TextDirection.rtl,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "" + posts['total'],
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Colors
                                                                  .black,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold),
                                                        ),
                                                        SizedBox(
                                                          width: 100,
                                                        ),
                                                        Column(
                                                          children: [
                                                            Text(
                                                              " استلام : " +
                                                                  posts[
                                                                  'time1'],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  17,
                                                                  color: ColorManager
                                                                      .black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              "توصيل : " +
                                                                  posts[
                                                                  'time2'],
                                                              style: TextStyle(
                                                                  fontSize:
                                                                  15,
                                                                  color: ColorManager
                                                                      .black,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap:(){
                                            Get.to(TrackOrders(
                                                services: posts['services'].toString(),
                                                city: posts['city'],
                                                progress: posts['progress'].toString(),
                                                country: posts['country'],
                                                cat: posts['cat'],
                                                price: posts['total'],
                                                items: posts['order'],
                                                date1:posts['date1'],
                                                date2:posts['date2'],
                                                address: posts['address1'],
                                                address2: posts['address2'],
                                                time1: posts['time1'],
                                                time2:posts['time2']
                                            ));
                                          },
                                        );
                                      }),
                                );
                              });
                        } else {
                          return Center(
                            child: Custom_Text(
                              text: "",
                              alignment: Alignment.center,
                              fontSize: 22,
                            ),
                          );
                        }
                    }
                  })),


          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Column(
          //       children: [
          //         SizedBox(
          //           height: 10,
          //         ),
          //
          //       ],
          //     ),
          //   ),
          // ),
        );
      }else{
      return Scaffold(
        appBar: AppBar(
          title: Custom_Text(
            text: "الطلب",
            color: Colors.black,
            fontSize: 20,
            alignment: Alignment.center,
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[200],
        body: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where('email', isEqualTo: e)
                    .snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.data!.docs.length > 0) {
                        return GetBuilder(
                            init: OrderController(),
                            builder: (context) {
                              return Container(
                                height: 3000,
                                child: ListView.builder(
                                  //scrollDirection: Axis.vertical,
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      DocumentSnapshot posts =
                                      snapshot.data!.docs[index];

                                      return InkWell(
                                        child: Container(
                                          width: 50,
                                          height: 130,
                                          child: Card(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Container(
                                                            width: 70,
                                                            height: 35,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    20),
                                                                color: Colors
                                                                    .blueAccent),
                                                            child:
                                                            Custom_Text(
                                                              text: "" +
                                                                  posts[
                                                                  'status'],
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .white,
                                                              alignment:
                                                              Alignment
                                                                  .center,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 60,
                                                      ),
                                                      Text(
                                                        "رقم الطلب " +
                                                            " :  " +
                                                            posts[
                                                            'code_num'],
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color:
                                                          ColorManager
                                                              .black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Directionality(
                                                  textDirection:
                                                  TextDirection.rtl,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "" + posts['total'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold),
                                                      ),
                                                      SizedBox(
                                                        width: 100,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            " استلام : " +
                                                                posts[
                                                                'time1'],
                                                            style: TextStyle(
                                                                fontSize:
                                                                17,
                                                                color: ColorManager
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            "توصيل : " +
                                                                posts[
                                                                'time2'],
                                                            style: TextStyle(
                                                                fontSize:
                                                                15,
                                                                color: ColorManager
                                                                    .black,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap:(){
                                          Get.to(TrackOrders(
                                              services: posts['services'].toString(),
                                              city: posts['city'],
                                              progress: posts['progress'].toString(),
                                              country: posts['country'],
                                              cat: posts['cat'],
                                              price: posts['total'],
                                              items: posts['order'],
                                              date1:posts['date1'],
                                              date2:posts['date2'],
                                              address: posts['address1'],
                                              address2: posts['address2'],
                                              time1: posts['time1'],
                                              time2:posts['time2']
                                          ));
                                        },
                                      );
                                    }),
                              );
                            });
                      } else {
                        return Center(
                          child: Custom_Text(
                            text: "",
                            alignment: Alignment.center,
                            fontSize: 22,
                          ),
                        );
                      }
                  }
                })),


        // SingleChildScrollView(
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: 10,
        //         ),
        //
        //       ],
        //     ),
        //   ),
        // ),
      );
    }

  }
}
