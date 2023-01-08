
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';
import 'package:course_app/screens/landry_y_tasks/screens/new_address.dart';
import 'package:course_app/screens/profile/profile_pic.dart';
import 'package:course_app/view_model/material_view_model.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../profile/profile_screen.dart';

class Prooffilee2 extends GetWidget<MaterialViewModel> {
  // String doctor, cat;

  // MaterialScreen({required this.doctor, required this.cat});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String name = box.read('name') ?? "";
    String email = box.read('email') ?? "";
    String address = box.read('address') ?? "";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue,
            Color.fromARGB(255, 38, 83, 122),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(BottomBar());
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ProfileScreen2());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 240),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 78, 78, 78),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.settings,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: ProfilePic(),

                      //     child: Center(
                      //   child: ToggleSwitch(
                      //     initialLabelIndex: controller.activeToggledIndex.value,
                      //     totalSwitches: 2,
                      //     inactiveBgColor: Color.fromARGB(255, 116, 27, 27),
                      //     minWidth: 145.0,
                      //     minHeight: 60.0,
                      //     activeFgColor: ColorManager.white,
                      //     inactiveFgColor: Colors.white54,
                      //     activeBgColor: [Colors.white10],
                      //     fontSize: 18.0,
                      //     labels: [
                      //       AppStrings.pdf,
                      //       AppStrings.videos,
                      //     ],
                      //     onToggle: (index) {
                      //       print("index=" + index.toString());
                      //       controller.changeToogleIndex(index!);
                      //       print(controller.activeToggledIndex.toString());
                      //     },
                      //   ),
                      // )
                    ),
                    // SizedBox(
                    //   width: 5,
                    // ),
                    // Container(
                    //   child: Image.asset(
                    //     "assets/images/Icon Settings.png",
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    email,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "العنوان",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        child:   Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('address')
                                    .where('email', isEqualTo: email)
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
                                                height: 600,
                                                child: ListView.builder(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: snapshot.data!.docs.length,
                                                    itemBuilder: (BuildContext context,
                                                        int index) {
                                                      DocumentSnapshot posts =
                                                      snapshot.data!.docs[index];

                                                      return
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Custom_Text(
                                                                  text: "" +
                                                                      posts[
                                                                      'name'],
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .black,
                                                                  alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                                ),
                                                                SizedBox(width:110,),
                                                                IconButton(onPressed:(){

                                                                }, icon:Icon(Icons.navigate_next_sharp,
                                                                  color:Colors.grey,))

                                                              ],
                                                            ),
                                                            Divider(
                                                              color:Colors.black,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Custom_Text(text: "اضف عنوان جديد",
                                                                  fontSize:19,color:Colors.blue,),
                                                                SizedBox(width: 40,),
                                                                IconButton(onPressed: (){
                                                                  Get.to(NewAddressScreen());
                                                                },
                                                                    icon: Icon(Icons.add_circle,
                                                                      color:Colors.blueAccent,)),
                                                              ],
                                                            )
                                                            
                                                          ],
                                                        );
                                                      //   Container(
                                                      //   width: 50,
                                                      //   height: 130,
                                                      //   child:  Custom_Text(
                                                      //     text: "" +
                                                      //         posts[
                                                      //         'name'],
                                                      //     fontSize: 15,
                                                      //     color: Colors
                                                      //         .black,
                                                      //     alignment:
                                                      //     Alignment
                                                      //         .center,
                                                      //   ),
                                                      //
                                                      //   // Card(
                                                      //   //   child: Column(
                                                      //   //     children: [
                                                      //   //       SizedBox(
                                                      //   //         height: 10,
                                                      //   //       ),
                                                      //   //       Directionality(
                                                      //   //         textDirection:
                                                      //   //         TextDirection.ltr,
                                                      //   //         child: Row(
                                                      //   //           children: [
                                                      //   //             SizedBox(
                                                      //   //               width: 10,
                                                      //   //             ),
                                                      //   //             Custom_Text(
                                                      //   //               text: "" +
                                                      //   //                   posts[
                                                      //   //                   'name'],
                                                      //   //               fontSize: 15,
                                                      //   //               color: Colors
                                                      //   //                   .black,
                                                      //   //               alignment:
                                                      //   //               Alignment
                                                      //   //                   .center,
                                                      //   //             ),
                                                      //   //             SizedBox(
                                                      //   //               width: 10,
                                                      //   //             ),
                                                      //   //
                                                      //   //           ],
                                                      //   //         ),
                                                      //   //       ),
                                                      //   //
                                                      //   //     ],
                                                      //   //   ),
                                                      //   // ),
                                                      // );
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


                        // ListView.builder(
                        //     scrollDirection: Axis.vertical,
                        //     shrinkWrap: true,
                        //     itemCount: 3,
                        //     itemBuilder: (context, index) {
                        //       return Card(
                        //         elevation: 0,
                        //         child: Container(
                        //           height: 75,
                        //           decoration:
                        //               BoxDecoration(color: Colors.white),
                        //           child: ListTile(
                        //             title: Text(
                        //               "Tessttttt",
                        //               style: TextStyle(
                        //                   fontSize: 15, color: Colors.grey),
                        //             ),
                        //             subtitle: Text(
                        //               "fyofoyuf",
                        //               style: TextStyle(
                        //                   fontSize: 20, color: Colors.black),
                        //             ),
                        //             trailing: Icon(
                        //               Icons.keyboard_arrow_right,
                        //               color: Colors.black,
                        //             ),
                        //           ),
                        //         ),
                        //       );
                        //     }),
                      ),
        
        

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
