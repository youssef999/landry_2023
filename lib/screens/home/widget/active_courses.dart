// import 'package:course_app/constants/colors.dart';
// import 'package:course_app/models/home_view_model.dart';
// import 'package:course_app/models/levels.dart';
// import 'package:course_app/screens/home/widget/category_titel.dart';
// import 'package:course_app/screens/home/widget/levels_slider.dart';
// import 'package:course_app/screens/courses/material.dart';
// import 'package:course_app/screens/pay/waiting%20screen.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/percent_indicator.dart';

// class GardViewHome extends StatelessWidget {
//   final levellist = Levels.generateLevels();
//   @override
//   Widget build(BuildContext context) {
//     return  SliverToBoxAdapter(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 17, right: 17),
//                   child: GridView.builder(
//                       physics: NeverScrollableScrollPhysics(),
//                       primary: false,
//                       shrinkWrap: true,
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         crossAxisSpacing: 18,
//                         mainAxisSpacing: 20,
//                       ),
//                       itemCount: 4,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   blurRadius: 8,
//                                 ),
//                               ]),
//                           child: Column(
//                             children: [
//                               Image.asset(
//                                 "assets/icons/Icon Shirt.png",
//                               ),

//                               //  Text("data")
//                               Column(
//                                 children: [
//                                   Text(
//                                     "غسيل وطي",
//                                     style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   // SizedBox(
//                                   //   height: 5,
//                                   // ),
//                                   Text(
//                                     "يومين",
//                                     style: TextStyle(
//                                         color: Colors.grey,
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
//                 ),
//               ));
//   }
// }
