import 'package:course_app/Local/local.dart';
import 'package:course_app/Local/local_controller.dart';
import 'package:course_app/auth/lang_choise.dart';
import 'package:course_app/helper/local_storge_data.dart';
import 'package:course_app/screens/home/widget/other_levels.dart';
import 'package:course_app/screens/landry_y_tasks/controllers/order_controller.dart';

import 'package:course_app/screens/pdfs/pref_serves.dart';
import 'package:course_app/screens/splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'helper/binding.dart';
import 'models/home_view_model.dart';
import 'screens/landry_y_tasks/controllers/landrt_controller.dart';
import 'view_model/auth_view_model.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  /// On click listner
}
void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LocalStorgeData());
    MyLocalController controller = Get.put(MyLocalController());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => OrderController());
    Get.put(LandryController());

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
        locale: controller.language,
        translations: MyLocal(),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
