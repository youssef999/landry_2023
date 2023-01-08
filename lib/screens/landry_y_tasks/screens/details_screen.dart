import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/landrt_controller.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/m_landry/maps/maps.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class DetailsScreen extends StatefulWidget {
  String data;
  DetailsScreen({required this.data});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final controller = Get.put(LandryController());
  double price = 0;
  List<ItemModel> itemData = [];

  @override
  Widget build(BuildContext context) {

    if (widget.data != null) {
      controller.price = 0;
      controller.orderItems=[];
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text(
          "${widget.data}",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: ListView(
          children: [

            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('cat')
                        //.where('cat',isEqualTo:controller.cat)
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator());
                        default:
                          if (snapshot.data!.docs.length > 0) {
                            return GetBuilder(
                                init: LandryController(),
                                builder: (context) {
                                  return Container(
                                    height: 40,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          DocumentSnapshot posts =
                                              snapshot.data!.docs[index];

                                          if (posts['name'] == controller.cat)
                                            return InkWell(
                                              child: AnimatedContainer(
                                                  width: 60,
                                                  //height: 5,
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.blue,
                                                        Color.fromARGB(
                                                            255, 38, 83, 122)
                                                      ],
                                                      begin: Alignment.topLeft,
                                                      end:
                                                          Alignment.bottomRight,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        posts['name'],
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                              // child: Container(
                                              //   child: Card(
                                              //     color: Colors.blue,
                                              //     child: Container(
                                              //       decoration: BoxDecoration(
                                              //           borderRadius:
                                              //               BorderRadius
                                              //                   .circular(17)),
                                              //       padding: EdgeInsets.only(
                                              //           left: 16,
                                              //           right: 16,
                                              //           top: 3,
                                              //           bottom: 3),
                                              //       child: Custom_Text(
                                              //         text: posts['name'],
                                              //         color: ColorManager.white,
                                              //         fontSize: 13,
                                              //         alignment:
                                              //             Alignment.center,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              onTap: () {
                                                controller
                                                    .changeCat(posts['name']);
                                              },
                                            );
                                          else
                                            return InkWell(
                                                child: Container(
                                                  child: Card(
                                                    color: Colors.grey,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      padding: EdgeInsets.only(
                                                          left: 16,
                                                          right: 16,
                                                          top: 3,
                                                          bottom: 3),
                                                      child: Custom_Text(
                                                        text: posts['name'],
                                                        color:
                                                            ColorManager.black,
                                                        fontSize: 13,
                                                        alignment:
                                                            Alignment.center,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                onTap: () {
                                                  controller
                                                      .changeCat(posts['name']);
                                                });
                                        }),
                                  );
                                });
                          } else {
                            return Center(
                              child: Custom_Text(
                                text: "لا يوجد بيانات",
                              ),
                            );
                          }
                      }
                    })),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: GetBuilder(
                    init: LandryController(),
                    builder: (context) {
                      return StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('${widget.data}')
                              .where('cat', isEqualTo: controller.cat)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData)
                              return Center(child: Text('Loading'));
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return new Text('Loading...');
                              default:
                                return Container(
                                  height: 900,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data!.docs.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        DocumentSnapshot posts =
                                            snapshot.data!.docs[index];
                                        // int quant=posts['quant'];
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 25,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  // SizedBox(
                                                  //   width: 1,
                                                  // ),
                                                  Container(
                                                    child: Text(
                                                      posts['name'],
                                                      style: TextStyle(
                                                          color: ColorManager
                                                              .black,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 50,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "سعر الوحدة " +
                                                          posts['price']
                                                              .toString(),
                                                      style: TextStyle(
                                                          color: ColorManager
                                                              .black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    width: 40,
                                                  ),
                                                  GetBuilder(
                                                      init: LandryController(),
                                                      builder: (context) {
                                                        return Row(
                                                          children: [
                                                            IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  ItemModel
                                                                      item =
                                                                      ItemModel(
                                                                          posts[
                                                                              'name'],
                                                                          posts['price']
                                                                              .toString());

                                                                  controller
                                                                      .removeItem(
                                                                          item);
                                                                },
                                                                icon: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          10),
                                                                  child: Icon(Icons
                                                                      .remove_circle_outline),
                                                                )),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 5),
                                                              child: Text(
                                                                '1'.toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 2,
                                                            ),
                                                            IconButton(
                                                                onPressed:
                                                                    () async {
                                                                  ItemModel
                                                                      item =
                                                                      ItemModel(
                                                                          posts[
                                                                              'name'],
                                                                          posts['price']
                                                                              .toString());
                                                                  controller.addPrice(
                                                                      double.parse(
                                                                          posts['price']
                                                                              .toString()));
                                                                  controller
                                                                      .addItems(
                                                                          item);
                                                                  //   controller.addPricing(posts['price'].toString());
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .add_circle_outline,
                                                                  color: Colors
                                                                      .blue,
                                                                ))
                                                          ],
                                                        );
                                                      })
                                                ],
                                              ),
                                            ),
                                            Divider()
                                          ],
                                        );
                                      }),
                                );
                            }
                          });
                    })),
            Center(child: CircularProgressIndicator())
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: InkWell(
          onTap: () {
            final box = GetStorage();
            String address = box.read('address') ?? "x";

            if (controller.price > 0 && address == 'x') {
              Get.to(MapsScreen(
                  cat: widget.data,//controller.cat,
                  price: controller.price.toString(),
                  order: controller.nameList,
                  pricing: controller.pricingList,
                  items: controller.orderItems
                  // cat:widget.data
                  ));
            } else if (address != 'x'&& controller.price > 0) {

              Get.to(MapsScreen(
                  cat: widget.data,//controller.cat,
                  price: controller.price.toString(),
                  order: controller.nameList,
                  pricing: controller.pricingList,
                  items: controller.orderItems,
                // cat:widget.data
              ));
              // Get.to(SavedAddress(
              //     cat: controller.cat.toString(),
              //     price: controller.price.toString(),
              //     order: controller.nameList,
              //     pricing: controller.pricingList,
              //     items: controller.orderItems));
            } else {
              Get.snackbar("خطأ", "يجب ان يتعدي الاجمالي 0 ",
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM);
            }
            // itemData.add(controller.orderItems)

            // Get.to(OrderScreen(
            //   cat: controller.cat,
            //   price: controller.price.toString(),
            //   order: controller.orderItems,
            //   pricing: controller.pricingList
            //
            // ));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 11.0, right: 11, bottom: 20),
            child: GetBuilder(
                init: LandryController(),
                builder: (context) {
                  return AnimatedContainer(
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
                            "العناصر المضافة",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Text(
                            " " + controller.price.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ));
                }
                //  child: Container(
                //    height: 40,
                //    color:Colors.blue,
                //    child: GetBuilder(
                //      init: LandryController(),
                //      builder: (context) {
                //        return Center(
                //          child: Text("الاجمالي   "+" "+controller.price.toString(),
                //           style:TextStyle(
                //             color:Colors.white,
                //             fontSize: 17
                //           ),
                //          ),
                //        );
                //      }
                //    ),
                //  ),
                ),
          ),
        ),
      ),
    );
  }
}
