import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        forceElevated: true,
        centerTitle: true,
        backgroundColor: Colors.white,
        expandedHeight: 130,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          background: Image.asset(
            "assets/images/Splash.png",
          ),
          title: Text(
            " اختر نوع الخدمة التي تهتم بها ادناه",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          centerTitle: true,
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        InkWell(
            onTap: () {
              print("ssssssssssssssss");
            },
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('Categories')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData)
                    return Center(child: CircularProgressIndicator());
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.data!.docs.length > 0) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 18,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot posts = snapshot.data!.docs[index];
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 8,
                                      ),
                                    ]),
                                child: Column(
                                  children: [
                                    Image.network(
                                      posts['image'],
                                      height: 80,
                                    ),
                                    Column(
                                      children: [
                                        Custom_Text(
                                          text: posts['name'],
                                          color: ColorManager.black,
                                          fontSize: 16,
                                          alignment: Alignment.center,
                                        ),
                                        Custom_Text(
                                          text: posts['des'],
                                          color: Colors.grey,
                                          fontSize: 14,
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () {
                                Get.to(DetailsScreen(
                                  data: posts['name'],
                                ));
                              },
                            );
                          }),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('ads').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return Center(child: Text('Loading'));
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return Container(
                        height: 400,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              DocumentSnapshot posts =
                                  snapshot.data!.docs[index];
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 320,
                                    height: 120,
                                    child: Card(
                                        child: Row(
                                      children: [
                                        // Container(
                                        //     width: 50,
                                        //     child:
                                        //         Image.network(posts['image'])),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                                width: 300,
                                              ),
                                              Center(
                                                child: Text(
                                                  posts['name'],
                                                  style: TextStyle(
                                                      color: ColorManager.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold),

                                                  // alignment: Alignment.center,
                                                ),
                                              ),
                                              SizedBox(
                                                //height: 5,
                                                width: 50,
                                              ),
                                              Center(
                                                child: Text(
                                                  posts['des'] + "     ",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .lightBlueAccent,
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold),

                                                  //  alignment: Alignment.center,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              Custom_Text(
                                                text: posts['date'],
                                                color: Colors.grey,
                                                fontSize: 14,
                                                alignment: Alignment.center,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )),
                                  ),
                                ],
                              );
                            }),
                      );
                  }
                })),
      ])),
    ]));
  }
}
