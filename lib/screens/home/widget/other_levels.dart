import 'package:course_app/models/levels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtherLevels extends StatelessWidget {
  final levellist = Levels.generateLevels();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/Splash.png",
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                primary: false,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 20,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
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
                        Image.asset(
                          "assets/icons/Icon Shirt.png",
                          height: 80,
                        ),

                        //  Text("data")
                        Column(
                          children: [
                            Text(
                              "غسيل وطي",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "يومين",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ]),
                    width: 330,
                    //  color: Colors.amberAccent,
                    child: Center(
                        child: Text(
                      "مساحة اعلانية",
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                )
              ],
            ),
          )
          //Image.asset("assets/images/Splash.png")
        ],
      ),
    );
  }
}
// appBar: PreferredSize(
//           child: AppBar(
//             backgroundColor: Colors.white,
//             flexibleSpace: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                   image: AssetImage("assets/images/Splash.png"),
//                 )),
//               ),
//             ),
//             title: Text(
//               "data",
//               style: TextStyle(fontSize: 25, color: Colors.black),
//             ),
//             centerTitle: true,
//           ),
//           preferredSize: Size.fromHeight(160)),
////////////////////////////////////
// GridView.builder(
//           physics: NeverScrollableScrollPhysics(),
//           primary: false,
//           shrinkWrap: true,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 18,
//             mainAxisSpacing: 20,
//           ),
//           itemCount: 4,
//           itemBuilder: (context, index) {
//             return Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 8,
//                       ),
//                     ]),
//                 child: Column(children: [
//                   Image.asset(
//                     "assets/icons/Icon Shirt.png",
//                     height: 80,
//                   ),
//                 ]));
//           }),