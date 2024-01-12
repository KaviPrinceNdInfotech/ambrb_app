import 'dart:io';

import 'package:ambrd_appss/modules/firebase_notification_service/firebase_new/firebase_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/home_controllers/home_controllers.dart';
import 'controllers/login_mobile_controller/login_mobile_controllers.dart';
import 'controllers/splash_controller/splash_controllers.dart';
import 'modules/splash_view/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  ///i created new class name is firebase api kumar prince extra its not needed
  await FirebaseApi().initNotifications();

  runApp(
    GetMaterialApp(
      title: "Application",

      //initialRoute: AppPages.INITIAL,
      //getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),
  );
}

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
    );
  }
}

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginMobileController>(
      () => LoginMobileController(),
    );
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
//ececcdcdcscscscsc28 dec 2023...
