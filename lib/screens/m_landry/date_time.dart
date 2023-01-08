// import 'dart:js';

import 'package:course_app/screens/landry_y_tasks/models/item_model.dart';
import 'package:course_app/screens/landry_y_tasks/screens/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DateTimeScreen extends StatefulWidget {
   String cat, price,address1,address2 ,city,country,latlong,placemark;
 List order;
 List pricing;
 List<ItemModel> items;



   DateTimeScreen({required this.cat, required this.price, required this.order, required this.pricing,
      required this.items,required this.address1,required this.address2,
   required this.country,required this.city,required this.latlong,required this.placemark
   }); // OrderScreen(
  // pricing: widget.pricing,
  // order: widget.order,
  // price: widget.price,
  // cat: widget.cat,
  // address: _placeMark!.locality.toString(),
  // address2: _placeMark!.locality.toString(),
  // city: _placeMark!.administrativeArea.toString(),
  // status: '',
  // country: _placeMark!.country.toString(),
  // code: '',
  // latLong:_latLong.toString(),
  // placeMark: _placeMark!.name!.toString(),
  // items: widget.items,
  // time1: '',
  // time2: '',
  // phone: '',
  // date1: '',
  // date2: '');
  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  final List<String> names = <String>["خمسة ايام", "ثلاثـة ايام", "يوم فقط"];
  final List<String> titlenames = <String>["اساسي", "زائـد", "سـريع"];
  final List<String> price = <String>["0", "3.99", "9.99"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          "برنـامج",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            children: [
              Row(children: [
                AnimatedContainer(
                  width: 130,
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
                        "التاريخ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(150.0, 48.0),
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (newDate == null) return;
                      date = newDate;
                      setState(() {
                        date = newDate;
                      });
                    },
                    child: Text(
                      "${date.year}/${date.month}/${date.day}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                AnimatedContainer(
                  width: 130,
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
                        "الوقـت",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(150.0, 48.0),
                        side: BorderSide(color: Colors.blue)),
                    onPressed: () async {
                      TimeOfDay? newTime = await showTimePicker(
                        context: context,
                        initialTime: time,
                      );
                      if (newTime == null) return;
                      setState(() {
                        time = newTime;
                      });
                    },
                    child: Text(
                      "${time.hour}:${time.minute}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ]),
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'خيارات التوصيل',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Container(
                  height: 260,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: AnimatedContainer(
                          width: 200,
                          //height: 5,
                          duration: Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.white, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Text(
                                    names[index],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  titlenames[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text("رسوم الخدمة",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Text(price[index] + " \$",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),


                              Padding(
                                padding: const EdgeInsets.only(left:18.0,right:18),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          String d2='';
                                          double services=0.0;
                                          if(price[index]=='0'){

                                              d2="${date.year}/${date.month}/${date.day+5}";
                                              services=0.0;
                                          }else if(price[index]=='3.99'){
                                            d2="${date.year}/${date.month}/${date.day+3}";
                                            services=3.99;

                                          }else if(price[index]=='9.99'){
                                            d2="${date.year}/${date.month}/${date.day+1}";
                                            services=9.99;
                                          }
                                        Get.to (OrderScreen(
                                          pricing: widget.pricing,
                                          order: widget.order,
                                          price: widget.price,
                                          cat: widget.cat,
                                          address: widget.address1,
                                          address2: widget.address2,
                                          city: widget.city,
                                          status: '',
                                          country: widget.country,
                                          services:services,
                                          code: '',
                                          latLong:widget.latlong,
                                          placeMark: widget.placemark,
                                          items: widget.items,
                                          time1: "${time.hour}:${time.minute}",
                                          time2: "${time.hour+3}:${time.minute+2}",
                                          phone: '',
                                          date1:   "${date.year}/${date.month}/${date.day}",
                                          date2: d2));

                                         // price[index]
                                        },
                                        child: AnimatedContainer(
                                          width: 80,
                                          height: 30,
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
                                                "اختار",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),

                                      // ElevatedButton(
                                      //   onPressed: () {
                                      //     print(_placeMark!.toJson());
                                      //   },
                                      //   child: Text('Confirm Location'),
                                      // ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        onTap: () {},
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(
                      width: 20,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
