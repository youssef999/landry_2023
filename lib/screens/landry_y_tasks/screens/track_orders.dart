
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/profile/profile_pic.dart';
import 'package:course_app/view_model/material_view_model.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class TrackOrders extends GetWidget<MaterialViewModel> {
  String  cat,date1,date2,time1,time2,address,address2,city,country,price;
    List items;
    String services;


  TrackOrders({
      required this.cat,required this.services,required this.city,required this.country,
    required this.address,required this.price,required this.address2
    ,required this.items,required this.date1,required this.date2,required this.time2,required this.time1
  }); // MaterialScreen({required this.doctor, required this.cat});

  @override
  Widget build(BuildContext context) {
    // final box = GetStorage();
    // String name = box.read('name') ?? "";
    // String email = box.read('email') ?? "";

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              //  Color.fromARGB(255, 38, 83, 122),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )),
        child: Padding(
          padding: const EdgeInsets.only(left:20.0),
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
                        height:120,
                        child:Image.asset('assets/images/progress.png')
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:Colors.blue
                    ),
                    child: Center(
                      child: Text(
                        cat,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                ]),
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
                              text: items[i].toString()
                                  .replaceAll('[', '').replaceAll(']',''),
                              fontSize:13,
                              color:Colors.black87,
                              alignment:Alignment.topLeft,
                            ),
                          ),
                          SizedBox(width: 30,),
                          // Custom_Text(
                          //   text: "=",
                          //   fontSize:13,
                          //   color:Colors.black87,
                          //   alignment:Alignment.topLeft,
                          // ),
                          SizedBox(width: 40,),
                          // Custom_Text(
                          //   text: items[i].price.toString()
                          //       .replaceAll('[', '').replaceAll(']',''),
                          //   fontSize:13,
                          //   color:Colors.red,
                          //   alignment:Alignment.topLeft,
                          // ),
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
                      Custom_Text(text: (double.parse(price)+double.parse(services)).toStringAsFixed(2),
                        fontSize:15,
                        color:Colors.red,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
