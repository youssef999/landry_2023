import 'package:course_app/auth/Sign_up.dart';
import 'package:course_app/auth/login.dart';
import 'package:course_app/screens/onbording.dart/on_board_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OnBrdingScreen extends StatefulWidget {
  @override
  State<OnBrdingScreen> createState() => _OnBrdingScreenState();
}

class _OnBrdingScreenState extends State<OnBrdingScreen> {
  int currentIndex = 0;
  late PageController _pageController;

  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/onbording 1.png',
      text: "افعل ما تحب نحن نهتم بملابسك",
      desc:
          "من خلال الانضمام فانك توافق علي شروط الخدمة وسياسة الخصوصية الخاصة بنا",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: 'assets/images/Splash.png',
      text: "خدمة الاستلام و التوصيل المجانية الي عتبة داركم",
      desc:
          "من خلال الانضمام فانك توافق علي شروط الخدمة وسياسة الخصوصية الخاصة بنا",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: 'assets/images/Splash.png',
      text: "أفضل جودة خدمة في المنطقة",
      desc:
          "من خلال الانضمام فانك توافق علي شروط الخدمة وسياسة الخصوصية الخاصة بنا",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: 1200,
          child: PageView.builder(
              itemCount: screens.length,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      screens[index].img,
                    ),
                    Text(
                      screens[index].text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                      height: 10.0,
                      child: ListView.builder(
                        itemCount: screens.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 3.0),
                                width: currentIndex == index ? 25 : 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.blue
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (index == screens.length - 1) {
                                Get.to(SignUpScreen());
                              }
                              _pageController.nextPage(
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.bounceIn);
                            },
                            child: AnimatedContainer(
                              width: 130,
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
                                    "اشتراك",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                minimumSize: Size(130.0, 48.0),
                                side: BorderSide(color: Colors.blue)),
                            onPressed: () {
                              if (index == screens.length - 1) {
                                Get.to(LoginScreen());
                              }
                              _pageController.nextPage(
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.bounceIn);
                            },
                            child: Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      screens[index].desc,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
