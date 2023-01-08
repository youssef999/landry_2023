import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePic2 extends StatefulWidget {
  const ProfilePic2({Key? key}) : super(key: key);

  @override
  State<ProfilePic2> createState() => _ProfilePic2State();
}

class _ProfilePic2State extends State<ProfilePic2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            child: SizedBox(
              height: 60,
              width: 60,
              child: Stack(
                fit: StackFit.expand,
                //  overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),

                  // Positioned(
                  //   bottom: 0,
                  //   right: -12,
                  //   child: SizedBox(
                  //       height: 46,
                  //       width: 46,
                  //       child: FlatButton(
                  //         padding: EdgeInsets.zero,
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(50),
                  //             side: BorderSide(color: Colors.white)),
                  //         color: Colors.white,
                  //         onPressed: () {},
                  //         child: SvgPicture.asset("assets/Camera Icon.svg"),
                  //       )),
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
